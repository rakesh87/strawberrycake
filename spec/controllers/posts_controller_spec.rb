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
    
    context "with a invalid param" do

      it "should raise error" do
          expect do
            get :show, id: 'wrong'
          end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end  
  end
end
