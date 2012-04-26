module Octopart
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield configuration
    end
  end

  class Configuration
    # Your octopart API key
    attr_accessor :apikey
  end
end
