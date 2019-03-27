# frozen_string_literal: true

module Amadeus
  module Namespaces
    class ReferenceData
      class Locations
        class PointsOfInterest
          # A namespaced client for the
          # +/v1/reference-data/locations/pois/by-square+ endpoints
          #
          # Access via the +Amadeus::Client+ object
          #
          #   amadeus = Amadeus::Client.new
          #   amadeus.reference_data.locations.points_of_interest.by_square
          #
          class BySquare < Amadeus::Client::Decorator
            # Returns a list of relevant point of interests
            #  around a defined square (4 points).
            #
            # @option params [Double] :north Latitude north of bounding box - required
            # @option params [Double] :west Longitude west of bounding box - required
            # @option params [Double] :south Latitude south of bounding box - required
            # @option params [Double] :east Longitude east of bounding box - required
            # @return [Amadeus::Response] a parsed response
            # @raise [Amadeus::Base] an exception if the call
            #   failed
            # @example What are the popular places in Barcelona?
            #   amadeus.reference_data.locations.points_of_interest.by_square.get(
            #     north: 41.397158,
            #     west: 2.160873,
            #     south: 41.394582,
            #     east: 2.177181
            #   )
            #
            def get(params = {})
              client.get('/v1/reference-data/locations/pois/by-square', params)
            end
          end
        end
      end
    end
  end
end
