# frozen_string_literal: true

module Amadeus
  module Namespaces
    class ReferenceData
      # A namespaced client for the
      # +/v2/reference-data/locations/:location_id+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.reference_data.locations('ALHR')
      #
      class Location < Amadeus::Client::Decorator
        # the Location ID
        attr_reader :location_id

        # Initialize this namespaced client with an
        # {Amadeus::Client} instance and an optional Location ID
        #
        # @param [Amadeus::Client] client
        # @param [Number] location_id
        #
        def initialize(client, location_id = nil)
          super(client)
          @location_id = location_id
        end

        # Returns details for a specific airport
        #
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example Find details for London Heathrow
        #   amadeus.reference_data.locations('ALHR').get
        #
        def get(params = {})
          client.get("/v1/reference-data/locations/#{@location_id}", params)
        end
      end
    end
  end
end
