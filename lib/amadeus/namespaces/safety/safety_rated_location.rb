# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Safety
      #   amadeus.safety.safety_rated_location('Q930400801')
      #
      class SafetyRatedLocation < Amadeus::Client::Decorator
        attr_reader :location_id

        #
        # @param [Amadeus::Client] client
        # @param [Number] location_id
        #
        def initialize(client, location_id = nil)
          super(client)
          @location_id = location_id
        end

        # Returns details for a specific place
        #
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example Retrieve safety information of 'Q930402753'
        #   amadeus.safety.safety_rated_location('Q930402753').get
        #
        def get(params = {})
          client.get("/v1/safety/safety-rated-locations/#{@location_id}", params)
        end
      end
    end
  end
end
