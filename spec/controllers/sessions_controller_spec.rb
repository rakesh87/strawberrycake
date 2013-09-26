# -*- encoding : utf-8 -*-
require 'spec_helper'

describe SessionsController do

  let!(:user) { create(:user, :provider => 'facebook', :uid => '12345') }

  describe "GET create" do

    def do_action
      get :create, :provider => 'facebook'
    end

    before do
      request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:facebook]
    end

    it "should redirect to posts_path" do
      do_action
      expect(response).to redirect_to(posts_path)
    end

    context "new user" do

      it "creates a new user" do
        expect do
          do_action
        end.to change { User.count }.by(1)
      end
    end

    context "user already registered" do

      let!(:already_registered_user) do
        create(:user, :provider => 'facebook', :uid => '1234567')
      end

      it "sets user id on session" do
        do_action
        expect(session[:user_id]).to eq(already_registered_user.id)
      end
    end
  end

  describe "GET failure" do
    def do_action
      get :failure
    end

    it "redirects to root url" do
      do_action
      expect(response).to redirect_to(root_url)
    end
  end

  describe "GET destroy" do
    def do_action
      get :destroy
    end

    before do
      session[:user_id] = "1"
    end

    it "should nuliffy user_id on sessions" do
      do_action
      expect(session[:user_id]).to be_nil
    end

    it "should redirect to root url" do
      do_action
      expect(response).to redirect_to(root_url)
    end

    it "sets a flash message" do
      do_action
      should set_the_flash.to("Volte em breve!")
    end
  end
end
