# -*- encoding : utf-8 -*-
require "spec_helper"

describe PostsController do
  describe "routing" do

    it "routes to #index" do
      get(root_path).should route_to("posts#index")
      root_path.should eq('/')
    end

    it "routes to #new" do
      get(new_post_path).should route_to("posts#new")
      new_post_path.should eq('/posts/new')
    end
  end
end
