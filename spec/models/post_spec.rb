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

  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "#authored_by?" do

    subject { post.authored_by? user }

    let(:post) { create(:post) }

    context "post author" do

      let(:user) { post.user }

      it { should be_true }
    end

    context "anyone else" do
      
      let(:user) { create(:user) }

      it { should be_false }
    end

  end
end
