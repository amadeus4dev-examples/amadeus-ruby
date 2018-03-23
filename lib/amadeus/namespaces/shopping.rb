# frozen_string_literal: true

module Amadeus
  module Namespaces
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
      # @return [Amadeus::Namespaces::Shopping::FlightDestinations]
      # @example
      #   amadeus.shopping.flight_destinations
      #
      def flight_destinations
        Amadeus::Namespaces::Shopping::FlightDestinations.new(client)
      end

      # The namespace for the FlightOffers API:
      #
      # @return [Amadeus::Namespaces::Shopping::FlightOffers]
      # @example
      #   amadeus.shopping.flight_offers
      #
      def flight_offers
        Amadeus::Namespaces::Shopping::FlightOffers.new(client)
      end

      # The namespace for the FlightDates API:
      #
      # @return [Amadeus::Namespaces::Shopping::FlightDates]
      # @example
      #   amadeus.shopping.flight_dates
      #
      def flight_dates
        Amadeus::Namespaces::Shopping::FlightDates.new(client)
      end

      # The namespace for the HotelOffers API:
      #
      # @return [Amadeus::Namespaces::Shopping::HotelOffers]
      # @example
      #   amadeus.shopping.hotel_offers
      #
      def hotel_offers
        Amadeus::Namespaces::Shopping::HotelOffers.new(client)
      end

      # The namespace for the Hotels API:
      #
      # @param [Number] hotel_id The ID for the hotel to find offers for
      # @return [Amadeus::Namespaces::Shopping::Hotels]
      # @example
      #   amadeus.shopping.hotels
      #
      def hotels(hotel_id = nil)
        Amadeus::Namespaces::Shopping::Hotel.new(client, hotel_id)
      end
    end
  end
end
