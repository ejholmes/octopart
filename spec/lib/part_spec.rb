require 'spec_helper'

describe Octopart::Part do
  describe "#find" do
    context "when given 0 arguments" do
      it "should raise an ArgumentError" do
        expect {
          described_class.find
        }.to raise_error ArgumentError
      end
    end
    context "when given a part uid" do
      use_vcr_cassette
      subject { described_class.find('39619421') }

      it { should be_a(Octopart::Part) }
      it { subject.uid.should eq(39619421) }
    end
    
    context "when given multiple part uids" do
      use_vcr_cassette
      subject { described_class.find(39619421, 29035751, 31119928)}

      it { should be_a(Array) }

      it "each object in the array should be a part" do
        subject.each { |part| part.should be_a(Octopart::Part) }
      end
    end
  end

  describe "#search" do
    context "when given a query" do
      use_vcr_cassette
      subject { described_class.search('resistor') }

      it { should be_a(Array) }

      it "each object in the array should be a part" do
        subject.each { |part| part.should be_a(Octopart::Part) }
      end
    end
  end

  describe "#match" do
    context "when given a manufacturer and an mpn" do
      use_vcr_cassette
      subject { described_class.match('texas instruments', 'SN74LS240N') }

      it { should eq(42315325996) }
    end
  end

  describe "#bom" do
    context "when give an mpn" do
      use_vcr_cassette
      subject { described_class.bom(mpn: 'SN74LS240N') }

      it { should be_a(Array) }
      it "each object in the array should be a part" do
        subject.each { |part| part.should be_a(Octopart::Part) }
      end
    end
  end

  describe ".datasheet" do
    context "when a part has datasheets" do
      use_vcr_cassette
      subject { described_class.find(39619421).datasheet }

      it { should eq('http://datasheet.octopart.com/H-46-6A-Bourns-datasheet-12570.pdf') }
    end

    context "when a part doesn't have any datasheets" do
      use_vcr_cassette
      subject { described_class.find(2042793624385).datasheet }

      it { should be_nil }
    end
  end
end
