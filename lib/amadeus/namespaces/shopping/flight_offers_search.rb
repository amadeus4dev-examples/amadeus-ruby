# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Shopping
      # A namespaced client for the
      # +/v2/shopping/flight-offers+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.flight_offers_search
      #
      class FlightOffersSearch < Amadeus::Client::Decorator
        # The namespace for the Prediction API:
        #
        # @return [Amadeus::Namespaces::Shopping::FlightOffersSearch::Prediction]
        # @example
        #   amadeus.shopping.flight_offers_search.prediction
        #
        def prediction
          Amadeus::Namespaces::Shopping::FlightOffersSearch::Prediction.new(client)
        end
        # Find the cheapest bookable flights.
        #
        # @option params [String] :origin City/Airport IATA code from which the
        #   flight will depart. BOS, for example.
        # @option params [String] :destination City/Airport IATA code to which
        #   the traveler is going. PAR, for example
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example Find the cheapest flight offers from New-York to Madrid,
        #   for the first of October 2020
        #   amadeus.shopping.flight_offers_search.get(
        #     originLocationCode: 'NYC',
        #     destinationLocationCode: 'MAD',
        #     departureDate: '2020-10-01',
        #     adults: 1
        #   )
        #

        def get(params = {})
          client.get('/v2/shopping/flight-offers', params)
        end

        # Find the cheapest bookable flights.
        #
        # @option body [JSON] :body flight search parameters
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call
        #   failed
        # @example
        #   amadeus.shopping.flight_offers_search.post(body)
        #
        def post(params = {})
          client.post('/v2/shopping/flight-offers', params)
        end
      end
    end
  end
end
