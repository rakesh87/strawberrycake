require "spec_helper"

describe PostsController do

  describe "routing" do

    it "routes to #home" do
      get("/").should route_to("pages#home")
    end
  end

  describe "route helpers" do

    it "root_path" do
      root_path.should eq("/")
    end
  end    
end