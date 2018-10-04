# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Shopping
      # A namespaced client for the
      # +/v1/shopping/flight-offers+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.flight_offers
      #
      class FlightOffers < Amadeus::Client::Decorator
        # Find the cheapest bookable flights.
        #
        # @option params [String] :origin City/Airport IATA code from which the
        #   flight will depart. BOS, for example.
        # @option params [String] :destination City/Airport IATA code to which
        #   the traveler is going. PAR, for example
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example Find the cheapest flight offers from New-York to Madrid for the first of August 2019
        #   amadeus.shopping.flight_offers.get(
        #     origin: 'NYC',
        #     destination: 'MAD',
        #     departureDate: '2019-08-01'
        #   )
        #
        def get(params = {})
          client.get('/v1/shopping/flight-offers', params)
        end
      end
    end
  end
end
