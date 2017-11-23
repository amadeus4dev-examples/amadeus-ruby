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
        # Find the cheapest flight dates from an origin to a destination.
        #
        # @option params [String] :origin City/Airport IATA code from which the
        #   flight will depart. BOS, for example.
        # @option params [String] :destination City/Airport IATA code to which
        #   the flight is going. BOS, for example.
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Exceptions::Base] an exception if the call failed
        # @example Find the cheapest flight from London Heathrow to Paris
        #   amadeus.shopping.flight_dates.get(origin: 'LHR',
        #                                     destination: 'PAR')
        #
        def get(params = {})
          client.get('/v1/shopping/flight-dates', params)
        end
      end
    end
  end
end
