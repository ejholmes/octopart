require 'spec_helper'

describe Octopart::Configuration do
  after(:each) { Octopart.configuration.apikey = nil }

  describe ".apikey" do
    it "can set the api key" do
      Octopart.configure do |config|
        config.apikey = 'apikey'
      end

      Octopart.configuration.apikey.should eq('apikey')
    end
  end
  
end
