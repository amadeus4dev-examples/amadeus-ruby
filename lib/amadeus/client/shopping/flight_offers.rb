module Amadeus
  class Client
    class Shopping
      # A namespaced client for the
      # +/v1/shopping/flight_offers+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.flight_offers
      #
      class FlightOffers < Amadeus::Client::Base
      end
    end
  end
end
