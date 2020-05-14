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
      # @return [Amadeus::Namespaces::Shopping::FlightOffersSearch]
      # @example
      #   amadeus.shopping.flight_offers_search
      #
      def flight_offers_search
        Amadeus::Namespaces::Shopping::FlightOffersSearch.new(client)
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

      # The namespace for the HotelOffersByHotel API:
      #
      # @return [Amadeus::Namespaces::Shopping::HotelOffersByHotel]
      # @example
      #   amadeus.shopping.hotel_offers_by_hotel
      #
      def hotel_offers_by_hotel
        Amadeus::Namespaces::Shopping::HotelOffersByHotel.new(client)
      end

      # The namespace for the HotelOffers API:
      #
      # @param [Number] offer_id The ID for the offer for a specific hotel
      # @return [Amadeus::Namespaces::Shopping::HotelOffer]
      # @example
      #   amadeus.shopping.hotel_offer(offer_id)
      #
      def hotel_offer(offer_id)
        Amadeus::Namespaces::Shopping::HotelOffer.new(client, offer_id)
      end
    end
  end
end
