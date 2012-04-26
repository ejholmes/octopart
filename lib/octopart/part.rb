module Octopart
  class Part < Base

    class << self

      def find(uid)
        response = JSON.parse(self.get('parts/get', uid: uid))
        self.build(response)
      end

      def search(query, options = {})
        params = options.merge(q: query)
        response = JSON.parse(self.get('parts/search', params))
        parts = []
        response['results'].each do |part|
          parts << part['item']
        end
        self.build(parts)
      end

      def match(manufacturer, mpn)
        
      end

      def bom(options = nil)
        
      end

      def build(object)
        if object.is_a?(Array)
          parts = []
          object.each do |obj|
            parts << self.build_single(obj)
          end
          parts
        elsif object.is_a?(Hash)
          self.build_single(object)
        else
          raise "What is this? I don't even..."
        end
      end

      def build_single(object)
        object = Hashie::Mash.new(object)
        part = self.new
        part.replace(object)
        part
      end

    end

  end
end
