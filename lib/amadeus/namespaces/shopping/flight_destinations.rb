# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Shopping
      # A namespaced client for the
      # +/v1/shopping/flight-destinations+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.flight_destinations
      #
      class FlightDestinations < Amadeus::Client::Decorator
        # Find the cheapest destinations where you can fly to.
        #
        # @option params [String] :origin City/Airport IATA code from which the
        #   flight will depart. BOS, for example.
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example Find the cheapest destinations from Madrid
        #   amadeus.shopping.flight_destinations.get(origin: 'MAD')
        #
        def get(params = {})
          client.get('/v1/shopping/flight-destinations', params)
        end
      end
    end
  end
end
