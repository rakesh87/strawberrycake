require "spec_helper"

describe PostsController do

  describe "routing" do

    it "routes to #home" do
      expect(get("/")).to route_to("pages#home")
    end
  end

  describe "route helpers" do

    it "root_path" do
      expect(root_path).to eq("/")
    end
  end    
end