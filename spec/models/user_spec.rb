require 'spec_helper'

describe User do
  describe "mass assignment" do
    [:name, :email].each do |attr|
      it { should allow_mass_assignment_of(attr) }
    end
  end

  describe "validations" do
    [:name, :email].each do |attr|
      it { should validate_presence_of(attr) }
    end
  end
  
end
