require 'spec_helper'

describe PostsController do
  
  describe "GET 'index'" do
    
    let!(:post) do
      create(:post)
    end

    before do
      get :index
    end

    it { should respond_with(:success) }
    it { should render_template(:index) }
    it { should render_with_layout(:application) }

    it "should assign all posts" do
      assigns(:posts).should include(post)
    end
  end

  describe "GET 'new'" do

    before do
      get :new
    end

    it { should respond_with(:success) }
    it { should render_template(:new) }
    it { should render_with_layout(:application) }

    it "should assign a new post" do
      assigns(:post).should be_a_new(Post)
    end
  end

  describe "GET 'show'" do

    context "with a valid param" do

      let!(:post) do
        create(:post)
      end

      before do
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
            get :show, id: 'wrong'
          end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end  
  end

  describe "DELETE destroy" do

    context "with a valid param" do

      let!(:post) do
        create(:post)
      end

      it "should destroy the post" do
        expect do
          delete :destroy, id: post
        end.to change(Post, :count).by(-1)
      end

      it "should redirects to post index" do
        delete :destroy, id: post
        should redirect_to(root_path)
      end

      it "should set the flash correctly" do
        delete :destroy, id: post
        should set_the_flash[:notice].to(/sucesso/)
      end
    end

    context "with an invalid param" do
      
      it "should raise error" do
        expect do
          delete :destroy, id: 'wrong'
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end  
  end
end
