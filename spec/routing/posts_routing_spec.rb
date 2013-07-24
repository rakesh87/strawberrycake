# -*- encoding : utf-8 -*-
require "spec_helper"

describe PostsController do

  describe "routing" do

    it "routes to #index" do
      get("/posts").should route_to("posts#index")
    end

    it "routes to #new" do
      get("/posts/new").should route_to("posts#new")
    end

    it "routes to #create" do
      post("/posts").should route_to("posts#create")
    end

    it "routes to #show" do
      get("/posts/1").should route_to("posts#show", id: "1")
    end

    it "routes to #destroy" do
      delete("/posts/1").should route_to("posts#destroy", :id => "1")
    end

    it "routes to #edit" do
      get("/posts/1/edit").should route_to("posts#edit", :id => "1")
    end

    it "routes to #update" do
      put("/posts/1").should route_to("posts#update", :id => "1")
    end
  end

   describe "route helpers" do

    xit "root_path" do
      root_path.should eq("/")
    end

    it "posts_path" do
      posts_path.should eq("/posts")
    end

    it "new_post_path" do
      new_post_path.should eq("/posts/new")
    end

    it "post_path" do
      post_path(1).should eq("/posts/1")
    end

    it "edit_post_path" do
      edit_post_path(1).should eq("/posts/1/edit")
    end
  end      
end
