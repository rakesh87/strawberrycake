require 'spec_helper'

describe PagesController do

  describe "GET 'index'" do

    before do
      get :home
    end

    it { should respond_with(:success) }
    it { should render_template(:home) }
    it { should render_with_layout(:application) }
  end

end
