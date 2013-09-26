require "spec_helper"

describe PostsController do

  describe "routing" do

    it "routes to #create" do
      expect(get("/auth/facebook/callback")).to route_to("sessions#create", :provider => "facebook")
    end
    it "routes to #failure" do
      expect(get("/auth/failure")).to route_to("sessions#failure")
    end
    it "routes to #destroy" do
      expect(delete("/logout")).to route_to("sessions#destroy")
    end
  end

  describe "route helpers" do

    it "auth_callback_path" do
      expect(auth_callback_path("facebook")).to eq("/auth/facebook/callback")
    end
    it "auth_failure_path" do
      expect(auth_failure_path).to eq("/auth/failure")
    end
    it "logout_path" do
      expect(logout_path).to eq("/logout")
    end        
  end    
end