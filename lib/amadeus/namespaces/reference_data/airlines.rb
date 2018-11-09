# frozen_string_literal: true

module Amadeus
  module Namespaces
    class ReferenceData
      # A namespaced client for the
      # +/v1/reference-data/airlines+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.reference_data.airlines
      #
      class Airlines < Amadeus::Client::Decorator
        # Returns the airline name for a given IATA code
        # @option params [String] :airlineCodes airline IATA code or ICAO code
        # - required
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example what is the name of airline code 'U2'
        #   amadeus.reference_data.airlines.get(airlineCodes: 'U2')
        #
        def get(params = {})
          client.get('/v1/reference-data/airlines', params)
        end
      end
    end
  end
end
