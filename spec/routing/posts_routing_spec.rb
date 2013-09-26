# -*- encoding : utf-8 -*-
require "spec_helper"

describe PostsController do

  describe "routing" do

    it "routes to #index" do
      expect(get("/posts")).to route_to("posts#index")
    end

    it "routes to #new" do
      expect(get("/posts/new")).to route_to("posts#new")
    end

    it "routes to #create" do
      expect(post("/posts")).to route_to("posts#create")
    end

    it "routes to #show" do
      expect(get("/posts/1")).to route_to("posts#show", id: "1")
    end

    it "routes to #destroy" do
      expect(delete("/posts/1")).to route_to("posts#destroy", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/posts/1/edit")).to route_to("posts#edit", :id => "1")
    end

    it "routes to #update" do
      expect(put("/posts/1")).to route_to("posts#update", :id => "1")
    end
  end

  describe "route helpers" do

    it "posts_path" do
      expect(posts_path).to eq("/posts")
    end

    it "new_post_path" do
      expect(new_post_path).to eq("/posts/new")
    end

    it "post_path" do
      expect(post_path(1)).to eq("/posts/1")
    end

    it "edit_post_path" do
      expect(edit_post_path(1)).to eq("/posts/1/edit")
    end
  end      
end
