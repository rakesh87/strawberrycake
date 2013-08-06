require 'spec_helper'

describe User do

  describe "validations" do
    [:uid, :email, :access_token, :provider].each do |attr|
      it { should validate_presence_of(attr) }
    end
  end

  describe "associations" do
    it { should have_many(:posts).dependent(:destroy) }
  end
  
end
