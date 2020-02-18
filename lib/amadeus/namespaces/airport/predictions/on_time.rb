# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Airport
      class Predictions
        # A namespaced client for the
        # +/v1/airport/predictions/on_time+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.airport.predictions.on_time
        #
        class OnTime < Amadeus::Client::Decorator
          # Returns a prediction on airport performance.
          #
          # @option params [String] :airportCode IATA code of the airport
          # @option params [String] :date date of the prediction, in the future
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call failed
          # @example
          #   amadeus.airport.predictions.on_time.get(airportCode: 'JFK', date: '2020-09-01')
          #
          def get(params = {})
            client.get('/v1/airport/predictions/on-time', params)
          end
        end
      end
    end
  end
end
