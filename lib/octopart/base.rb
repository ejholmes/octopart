module Octopart
  class Base < Hashie::Mash
    API_BASE = 'http://octopart.com/api/v2/'

    class << self

      def get(path, params = nil)
        RestClient.get("#{API_BASE}#{path}", params: params)
      end

    end

  end
end
