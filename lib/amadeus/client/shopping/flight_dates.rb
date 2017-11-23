module Amadeus
  class Client
    class Shopping
      # A namespaced client for the
      # +/v1/shopping/flight-dates+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.flight_dates
      #
      class FlightDates < Amadeus::Client::Decorator
      end
    end
  end
end
