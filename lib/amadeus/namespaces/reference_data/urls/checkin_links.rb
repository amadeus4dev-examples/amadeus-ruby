# frozen_string_literal: true

module Amadeus
  module Namespaces
    class ReferenceData
      class Urls
        # A namespaced client for the
        # +/v2/reference-data/urls/checkin-links+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.reference_data.urls.checkin_links
        #
        class CheckinLinks < Amadeus::Client::Decorator
          # Returns the checkin links for an airline, for the
          # language of your choice
          #
          # @option params [String] :airlineCode airline ID - required
          # @option params [String] :language (en-GB) the locale for the links
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call failed
          # @example Find a the checkin links for British Airways
          #   amadeus.reference_data.urls.checkin_links.get(airlineCode: 'BA')
          #
          def get(params = {})
            client.get('/v2/reference-data/urls/checkin-links', params)
          end
        end
      end
    end
  end
end
