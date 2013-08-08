# encoding: UTF-8
shared_examples "authentication required" do

  context "not logged in" do

    before do
      action
    end

    it "redirects to root_path" do
      should redirect_to(root_path)
    end

    it "sets a flash message" do
      should set_the_flash.to("Você precisa estar autenticado...")
    end
  end
end  