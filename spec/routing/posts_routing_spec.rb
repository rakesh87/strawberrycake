# -*- encoding : utf-8 -*-
require "spec_helper"

describe PostsController do
  describe "routing" do

   it "routes to #index" do
      get(root_path).should route_to("posts#index")
    end
  end
end
