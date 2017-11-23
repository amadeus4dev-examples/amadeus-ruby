module Amadeus
  class Client
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
      end
    end
  end
end
