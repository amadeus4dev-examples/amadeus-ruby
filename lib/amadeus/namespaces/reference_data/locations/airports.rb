# frozen_string_literal: true

module Amadeus
  module Namespaces
    class ReferenceData
      class Locations
        # A namespaced client for the
        # +/v1/reference-data/locations/airports+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.reference_data.locations.airports
        #
        class Airports < Amadeus::Client::Decorator
          # Returns a list of relevant airports near to a given point.
          #
          # @option params [Double] :latitude latitude location to be at the
          #   center of the search circle - required
          # @option params [Double] :longitude longitude location to be at the
          #   center of the search circle - required
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call
          #   failed
          # @example Find the nearest airport to the 49.0000,2.55 lat/long
          #   amadeus.reference_data.locations.airports.get(
          #     longitude: 49.0000,
          #     latitude: 2.55
          #   )
          #
          def get(params = {})
            client.get('/v1/reference-data/locations/airports', params)
          end
        end
      end
    end
  end
end
