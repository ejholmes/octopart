require 'spec_helper'

describe Octopart::Part do
  describe "#find" do
    context "when given a part uid" do
      use_vcr_cassette
      subject { described_class.find('39619421') }

      it { should be_a(Octopart::Part) }
      it { subject.uid.should eq(39619421) }
    end
  end

  describe "#search" do
    
  end

  describe "#match" do
    
  end

  describe "#bom" do
    
  end
end
