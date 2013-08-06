require "spec_helper"

describe PostsController do

  describe "routing" do

    it "routes to #create" do
      get("/auth/provider/callback").should route_to("sessions#create", :provider => "provider")
    end
    it "routes to #failure" do
      get("/auth/failure").should route_to("sessions#failure")
    end
    it "routes to #destroy" do
      get("/logout").should route_to("sessions#destroy")
    end
  end

  describe "route helpers" do

    it "auth_callback_path" do
      auth_callback_path("provider").should eq("/auth/provider/callback")
    end
    it "auth_failure_path" do
      auth_failure_path.should eq("/auth/failure")
    end
    it "logout_path" do
      logout_path.should eq("/logout")
    end        
  end    
end