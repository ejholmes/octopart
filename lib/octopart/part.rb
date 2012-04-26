module Octopart
  class Part < Base

    class << self

      def find(uid)
        response = JSON.parse(self.get('parts/get', uid: uid))
        self.build(response)
      end

      def search(query, options = nil)
        
      end

      def match(manufacturer, mpn)
        
      end

      def bom(options = nil)
        
      end

      def build(hash)
        hash = Hashie::Mash.new(hash)
        part = self.new
        part.replace(hash)
        part
      end

    end

  end
end
