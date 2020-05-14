# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Shopping
      class FlightOffersSearch
        # A namespaced client for the
        # +/v2/shopping/flight-offers/prediction+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.shopping.flight_offers_search.prediction
        #
        class Prediction < Amadeus::Client::Decorator
          # Returns a list of flight offers including a choice prediction for each itineary.
          #
          # @option body [JSON] :body JSON response of the Flight Offers Search API
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call
          #   failed
          # @example
          #   amadeus.shopping.flight_offers_search.prediction.post(
          #    flight_offers_search_response.body)
          #
          def post(params = {})
            client.post('/v2/shopping/flight-offers/prediction', params)
          end
        end
      end
    end
  end
end
