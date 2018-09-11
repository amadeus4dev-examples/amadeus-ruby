# frozen_string_literal: true

module Amadeus
  class Client
    # Helper methods to for the {Amadeus::Response} object to help it
    # paginate to next, previous, and first/last pages
    module Pagination
      # Finds the next page, if there is any, and otherwise
      # returns nil
      #
      # @param [Amadeus::Response] response the response to fetch the next
      #   page for
      # @return [Amadeus::Response]
      #
      # @example Fetch the next page
      #   page1 = amadeus.reference_data.locations.get(
      #     keyword: 'lon',
      #     subType: Amadeus::Location::ANY
      #   )
      #   page2 = amadeus.next(page1)
      #
      def next(response)
        page(:next, response)
      end

      # Finds the previous page, if there is any, and otherwise
      # returns nil
      #
      # @param [Amadeus::Response] response the response to fetch the previous
      #   page for
      # @return [Amadeus::Response]
      #
      # @example Fetch the previous page
      #   page2 = amadeus.reference_data.locations.get(
      #     keyword: 'lon',
      #     subType: Amadeus::Location::ANY,
      #     page: { offset: 2 }
      #   )
      #   page1 = amadeus.previous(page1)
      #
      def previous(response)
        page(:previous, response)
      end

      # Finds the last page, if there is any, and otherwise
      # returns nil
      #
      # @param [Amadeus::Response] response the response to fetch the last page
      #   for
      # @return [Amadeus::Response]
      #
      # @example Fetch the last page
      #   page1 = amadeus.reference_data.locations.get(
      #     keyword: 'lon',
      #     subType: Amadeus::Location::ANY
      #   )
      #   last_page = amadeus.last(page1)
      #
      def last(response)
        page(:last, response)
      end

      # Finds the first page, if there is any, and otherwise
      # returns nil
      #
      # @param [Amadeus::Response] response the response to fetch the first page
      #   for
      # @return [Amadeus::Response]
      #
      # @example Fetch the first page
      #   page10 = amadeus.reference_data.locations.get(
      #     keyword: 'lon',
      #     subType: Amadeus::Location::ANY,
      #     page: { offset: 10 }
      #   )
      #   page1 = amadeus.first(page1)
      #
      def first(response)
        page(:first, response)
      end

      private

      # Determine the page number for the given page name
      def page_number_for(name, response)
        response.result['meta']['links'][name.to_s].split('=').last.to_i
      rescue NoMethodError
        nil
      end

      # Make a new API call for the same request, but with a new
      # page number
      def page(name, response)
        page_number = page_number_for(name, response)
        return nil unless page_number

        params = response.request.params.clone
        params['page'] ||= {}
        params['page']['offset'] = page_number
        request(response.request.verb, response.request.path, params)
      end
    end
  end
end
