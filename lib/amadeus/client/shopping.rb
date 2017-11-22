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
    class Shopping < Amadeus::Client::Decorator
      # The namespace for the FlightDestinations API:
      #
      #   amadeus.shopping.flight_destinations
      #
      def flight_destinations
        Amadeus::Client::Shopping::FlightDestinations.new(client)
      end

      # The namespace for the FlightOffers API:
      #
      #   amadeus.shopping.flight_offers
      #
      def flight_offers
        Amadeus::Client::Shopping::FlightOffers.new(client)
      end

      # The namespace for the FlightDates API:
      #
      #   amadeus.shopping.flight_dates
      #
      def flight_dates
        Amadeus::Client::Shopping::FlightDates.new(client)
      end

      # The namespace for the HotelOffers API:
      #
      #   amadeus.shopping.hotel_offers
      #
      def hotel_offers
        Amadeus::Client::Shopping::HotelOffers.new(client)
      end

      # The namespace for the Hotels API:
      #
      #   amadeus.shopping.hotels
      #
      def hotels
        Amadeus::Client::Shopping::Hotels.new(client)
      end
    end
  end
end
