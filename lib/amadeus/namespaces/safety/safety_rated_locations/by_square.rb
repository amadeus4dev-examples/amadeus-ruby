# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Safety
      class SafetyRatedLocations
        # A namespaced client for the
        # +/v1/safety/safety_rated_locations/by-square+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.safety.safety_rated_locations.by_square
        #
        class BySquare < Amadeus::Client::Decorator
          # Returns a list of relevant safety information
          #  around a defined square (4 points).
          #
          # @option params [Double] :north Latitude north of bounding box - required
          # @option params [Double] :west Longitude west of bounding box - required
          # @option params [Double] :south Latitude south of bounding box - required
          # @option params [Double] :east Longitude east of bounding box - required
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call
          #   failed
          # @example How safe is Barcelona?
          #   amadeus.safety.safety_rated_locations.by_square.get(
          #     north: 41.397158,
          #     west: 2.160873,
          #     south: 41.394582,
          #     east: 2.177181
          #   )
          #
          def get(params = {})
            client.get('/v1/safety/safety-rated-locations/by-square', params)
          end
        end
      end
    end
  end
end
