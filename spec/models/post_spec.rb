require 'spec_helper'

describe Post do
  describe "mass assignment" do
    [:title, :content].each do |attr|
      it { should allow_mass_assignment_of(attr) }
    end
  end
  
  describe "validantions" do
    [:title, :content].each do |attr|
      it { should validate_presence_of(attr) }
    end
  end

end
