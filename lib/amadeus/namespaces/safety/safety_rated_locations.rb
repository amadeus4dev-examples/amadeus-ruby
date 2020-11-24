# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Safety
      # A namespaced client for the
      # +/v1/safety/safety_rated_locations/+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.safety.safety_rated_locations
      #
      class SafetyRatedLocations < Amadeus::Client::Decorator
        # The namespace for the Safe Place API:
        #
        # @return [Amadeus::Namespaces::Safety::SafetyRatedLocations]
        # @example
        #   amadeus.safety.safety_rated_locations.by_square
        #
        def by_square
          Amadeus::Namespaces::Safety::SafetyRatedLocations::BySquare.new(client)
        end

        # Returns a list of relevant safety information near to a given point.
        #
        # @option params [Double] :latitude latitude location to be at the
        #   center of the search circle - required
        # @option params [Double] :longitude longitude location to be at the
        #   center of the search circle - required
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call
        #   failed
        # @example What are the different safety information in Barcelona
        #   amadeus.safety.safety_rated_locations.get(
        #     latitude: 41.397158,
        #     longitude: 2.160873
        #   )
        #
        def get(params = {})
          client.get('/v1/safety/safety-rated-locations', params)
        end
      end
    end
  end
end
