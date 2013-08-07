# encoding: UTF-8
require 'spec_helper'

describe PostsController do
  
  describe "GET 'index'" do

    context "not logged in" do

      before do
        get :index
      end

      it "redirects to root_path" do
        should redirect_to(root_path)
      end

      it "sets a flash message" do
        should set_the_flash.to("Você precisa estar autenticado...")
      end
    end

    context "logged in" do

      let!(:post) do
        create(:post)
      end

      before do
        login!
        get :index
      end

      it { should respond_with(:success) }
      it { should render_template(:index) }
      it { should render_with_layout(:application) }

      it "should assign all posts" do
        assigns(:posts).should include(post)
      end
    end  
  end

  describe "GET 'new'" do

    context "not logged in" do

      before do
        get :new
      end      

      it "redirects to root_path" do
        should redirect_to(root_path)
      end

      it "sets a flash message" do
        should set_the_flash.to("Você precisa estar autenticado...")
      end
    end

    context "logged in" do

    before do
      login!
      get :new
    end

      it { should respond_with(:success) }
      it { should render_template(:new) }
      it { should render_with_layout(:application) }

      it "should assign a new post" do
        assigns(:post).should be_a_new(Post)
      end
    end  
  end

  describe "POST 'create'" do

    context "not logged in" do

      before do
        get :create
      end    

      it "redirects to root_path" do
        should redirect_to(root_path)
      end

      it "sets a flash message" do
        should set_the_flash.to("Você precisa estar autenticado...")
      end
    end

    context "logged in" do

      before do
        login!
        get :create
      end   

      context "with valid params" do

        let(:params) do
          { post:  attributes_for(:post) }
        end

        it "should create a new post" do
          expect do
            post :create, params
          end.to change(Post, :count).by(1)
        end

        it "should assigns a newly @post" do
          post :create, params
          assigns(:post).should be_a(Post)
        end

        it "should @post be persisted" do
          post :create, params
          assigns(:post).should be_persisted
        end

        it "should redirects to the root path" do
          post :create, params
          should redirect_to(posts_path)
        end

        it "should set the flash correctly" do
          post :create, params
          should set_the_flash[:notice].to(/sucesso/)
        end
      end  

      context "with invalid params" do

        let(:params) do
          { post:  attributes_for(:post, content: "") }
        end

        it "should not create a new post" do
          expect do
            post :create, params
          end.to_not change(Post, :count)
        end

        it "should assign @post with a new one" do
          post :create, params
          assigns(:post).should be_a_new(Post)
        end

        it "should re-render the 'new' template" do
            post :create, params
            should render_template("new")
        end
      end
    end    
  end  

  describe "GET 'show'" do

    context "not logged in" do

      let!(:post) do
        create(:post)
      end

      before do
        get :show, id: post
      end

      it "redirects to root_path" do
        should redirect_to(root_path)
      end

      it "sets a flash message" do
        should set_the_flash.to("Você precisa estar autenticado...")
      end
    end

    context "logged in" do   

      context "with a valid param" do

        let!(:post) do
          create(:post)
        end

        before do
          login!
          get :show, id: post
        end

        it { should respond_with(:success) }
        it { should render_template(:show) }
        it { should render_with_layout(:application) }

        it "should assign post" do
          assigns(:post).should eq(post)
        end
      end
      
      context "with an invalid param" do

        it "should raise error" do
            expect do
              login!
              get :show, id: 'wrong'
            end.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end    
  end

  describe "DELETE destroy" do

    context "not logged in" do

      let!(:post) do
        create(:post)
      end

      before do
        get :destroy, id: post
      end

      it "redirects to root_path" do
        should redirect_to(root_path)
      end

      it "sets a flash message" do
        should set_the_flash.to("Você precisa estar autenticado...")
      end
    end

    context "logged in" do

      context "with a valid param" do

        let!(:post) do
          create(:post)
        end

        it "should destroy the post" do
          expect do
            login!
            delete :destroy, id: post
          end.to change(Post, :count).by(-1)
        end

        it "should redirects to post index" do
          login!
          delete :destroy, id: post
          should redirect_to(posts_path)
        end

        it "should set the flash correctly" do
          login!
          delete :destroy, id: post
          should set_the_flash[:notice].to(/sucesso/)
        end
      end

      context "with an invalid param" do
        
        it "should raise error" do
          login!
          expect do
            delete :destroy, id: 'wrong'
          end.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end   
  end

  describe "POST 'edit'" do

    context "not logged in" do

      let!(:post) do
        create(:post)
      end

      before do
        get :edit, id: post
      end

      it "redirects to root_path" do
        should redirect_to(root_path)
      end

      it "sets a flash message" do
        should set_the_flash.to("Você precisa estar autenticado...")
      end
    end

    context "logged in" do

      context "with a valid param" do

        let!(:post) do
          create(:post)
        end

        before do
          login!
          get :edit, id: post
        end

        it { should respond_with(:success) }
        it { should render_template(:edit) }
        it { should render_with_layout(:application) }

        it "should assign post" do
          assigns(:post).should eq(post)
        end
      end

      context "with an invalid param" do

        it "should raise error" do
          expect do
            login!
            get :edit, id: 'wrong'
          end.to raise_error(ActiveRecord::RecordNotFound)
        end
      end
    end  
  end

  describe "PUT 'update'" do

    context "not logged in" do

      let(:post) do
        create(:post)
      end

      before do
        get :update, id: post
      end

      it "redirects to root_path" do
        should redirect_to(root_path)
      end

      it "sets a flash message" do
        should set_the_flash.to("Você precisa estar autenticado...")
      end
    end

    context "logged in" do

      let(:post) do
        create(:post)
      end

      context "with valid params" do

        let(:params) do
          {
            id: post,
            post:  attributes_for(:post, title: "Trakinas meio a meio", content: "Chocolícia, Cookies, Piraquê de Morango =P")
          }
        end

        it "should update the post" do
          expect do
            login!
            put :update, params
          end.to change{ post.reload.title }.from("Trakinas de morango").to("Trakinas meio a meio")
        end

        it "should assigns correct @post" do
          login!
          put :update, params
          assigns(:post).should eq(post)
        end

        it "should redirects to root_path" do
          login!
          put :update, params
          should redirect_to(posts_path)
        end

        it "should set the flash correctly" do
          login!
          put :update, params
          should set_the_flash[:notice].to(/sucesso/)
        end
      end

      context "with invalid params" do

        let(:params) do
          {
            id: post,
            post:  attributes_for(:post, title: "")
          }
        end

        it "should not update the post" do
          expect do
            login!
            put :update, params
          end.to_not change{ post.title }
        end

        it "should assign correct @post" do
          login!
          put :update, params
          assigns(:post).should eq(post)
        end

        it "should re-render the 'edit' template" do
          login!
          put :update, params
          should render_template("edit")
        end
      end
    end  
  end
end
