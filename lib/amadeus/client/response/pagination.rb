module Amadeus
  class Response
    # Helper methods to for the {Amadeus::Response} object to help it
    # paginate to next, previous, and first/last pages
    module Pagination
      # Finds the next page, if there is any, and otherwise
      # returns nil
      #
      # @return [Amadeus::Response]
      def next
        page(:next)
      end

      # Finds the previous page, if there is any, and otherwise
      # returns nil
      #
      # @return [Amadeus::Response]
      def previous
        page(:previous)
      end

      # Finds the last page, if there is any, and otherwise
      # returns nil
      #
      # @return [Amadeus::Response]
      def last
        page(:last)
      end

      # Finds the first page, if there is any, and otherwise
      # returns nil
      #
      # @return [Amadeus::Response]
      def first
        page(:first)
      end

      private

      # Determine the page number for the given page name
      def page_number_for(name)
        result['meta']['links'][name.to_s].split('=').last.to_i
      rescue NoMethodError
        nil
      end

      # Make a new API call for the same request, but with a new
      # page number
      def page(name)
        page_number = page_number_for(name)
        return nil unless page_number
        request = @request.merge(page: { offset: page_number })
        Amadeus::Response.new(request.call, request)
      end
    end
  end
end
