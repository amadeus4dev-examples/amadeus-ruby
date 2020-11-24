# frozen_string_literal: true

module Amadeus
  module Namespaces
    class ReferenceData
      class Locations
        # A namespaced client for the
        # +/v1/reference-data/locations/pois/:location_id+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.reference_data.locations.point_of_interest('9CB40CB5D0')
        #
        class PointOfInterest < Amadeus::Client::Decorator
          # the Location ID
          attr_reader :poi_location_id

          # Initialize this namespaced client with an
          # {Amadeus::Client} instance and an optional Location ID
          #
          # @param [Amadeus::Client] client
          # @param [Number] poi_location_id
          #
          def initialize(client, poi_location_id = nil)
            super(client)
            @poi_location_id = poi_location_id
          end

          # Returns details for a specific poi
          #
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call failed
          # @example Retrieve poi information of '9CB40CB5D0'
          #   amadeus.reference_data.locations.point_of_interest('9CB40CB5D0').get
          #
          def get(params = {})
            client.get("/v1/reference-data/locations/pois/#{@poi_location_id}", params)
          end
        end
      end
    end
  end
end
