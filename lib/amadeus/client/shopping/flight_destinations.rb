module Amadeus
  class Client
    class Shopping
      # A namespaced client for the
      # +/v1/shopping/flight_destinations+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.flight_destinations
      #
      class FlightDestinations < Amadeus::Client::Base
      end
    end
  end
end
