# frozen_string_literal: true

module Amadeus
  module Namespaces
    class ReferenceData
      class Locations
        # A namespaced client for the
        # +/v1/reference-data/locations/pois+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.reference_data.locations.points_of_interest
        #
        class PointsOfInterest < Amadeus::Client::Decorator
          # The namespace for the Point Of Interest API:
          #
          # @return [Amadeus::Namespaces::ReferenceData::Locations::PointsOfInterest]
          # @example
          #   amadeus.reference_data.locations.points_of_interest.by_square
          #
          def by_square
            Amadeus::Namespaces::ReferenceData::Locations::PointsOfInterest::BySquare.new(client)
          end

          # Returns a list of relevant point of interests near to a given point.
          #
          # @option params [Double] :latitude latitude location to be at the
          #   center of the search circle - required
          # @option params [Double] :longitude longitude location to be at the
          #   center of the search circle - required
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call
          #   failed
          # @example What are the popular places in Barcelona?
          #   amadeus.reference_data.locations.points_of_interest.get(
          #     latitude: 41.397158,
          #     longitude: 2.160873
          #   )
          #
          def get(params = {})
            client.get('/v1/reference-data/locations/pois', params)
          end
        end
      end
    end
  end
end
