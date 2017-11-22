module Amadeus
  class Client
    # A namespaced client for the
    # +/v1/shopping+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.shopping
    #
    class Shopping < Amadeus::Client::Base
      # The namespace for the flight_destinations API:
      #
      #   amadeus.shopping.flight_destinations
      #
      def flight_destinations
        Amadeus::Client::Shopping::FlightDestinations.new(client)
      end

      # The namespace for the flight_offers API:
      #
      #   amadeus.shopping.flight_offers
      #
      def flight_offers
        Amadeus::Client::Shopping::FlightOffers.new(client)
      end

      # The namespace for the flight_dates API:
      #
      #   amadeus.shopping.flight_dates
      #
      def flight_dates
        Amadeus::Client::Shopping::FlightDates.new(client)
      end

      # The namespace for the hotel_offers API:
      #
      #   amadeus.shopping.hotel_offers
      #
      def hotel_offers
        Amadeus::Client::Shopping::HotelOffers.new(client)
      end

      # The namespace for the hotels API:
      #
      #   amadeus.shopping.hotels
      #
      def hotels
        Amadeus::Client::Shopping::Hotels.new(client)
      end
    end
  end
end
