# encoding: UTF-8
require 'spec_helper'

describe ApplicationController do
  let!(:user) { create(:user) }

  describe "current_user helper" do
    context "with user logged in" do
      before do
        session[:user_id] = user.id
      end

      it "returns the logged user" do
        expect(controller.send(:current_user)).to eq(user)
      end
    end

    context "without user logged in" do
      it "returns nil" do
        expect(controller.send(:current_user)).to be_nil
      end
    end

    context "can't find the user" do
      before do
        session[:user_id] = "#77"
      end

      it "returns nil" do
        expect(controller.send(:current_user)).to be_nil
      end

      it "unsets the session[:user_id]" do
        controller.send(:current_user)
        expect(session[:user_id]).to be_nil
      end
    end
  end

  describe "user_signed_in? helper" do
    context "with user logged in" do
      before do
        session[:user_id] = user.id
      end

      it "returns true" do
        expect(controller.send(:user_signed_in?)).to be_true
      end
    end

    context "without user logged in" do
      it "returns false" do
        expect(controller.send(:user_signed_in?)).to be_false
      end
    end
  end

  describe "authenticate! filter" do
    context "with user logged in" do
      before do
        session[:user_id] = user.id
      end

      it "returns true" do
        expect(controller.send(:authenticate!)).to be_true
      end
    end
  end
end