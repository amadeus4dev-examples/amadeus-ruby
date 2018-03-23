# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Shopping
      # A namespaced client for the
      # +/v1/shopping/hotels+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.hotels(123)
      #
      class Hotel < Amadeus::Client::Decorator
        # the Hotel ID
        attr_reader :hotel_id

        # Initialize this namespaced client with an
        # {Amadeus::Client} instance and a Hotel ID
        #
        # @param [Amadeus::Client] client
        # @param [Number] hotel_id
        #
        def initialize(client, hotel_id)
          super(client)
          @hotel_id = hotel_id
        end

        # The namespace for the Hotels::Offers API:
        #
        # @param [Number] offer_id The ID for the offer to find details for
        # @return [Amadeus::Namespaces::Shopping::Hotels::Offers]
        # @example
        #   amadeus.shopping.hotels('SMPARCOL').offers(234)
        #
        def offers(offer_id = nil)
          Amadeus::Namespaces::Shopping::Hotel::Offer.new(
            client, @hotel_id, offer_id
          )
        end

        # The namespace for the Hotels::HotelOffers API:
        #
        # @return [Amadeus::Namespaces::Shopping::Hotels::HotelOffers]
        # @example
        #   amadeus.shopping.hotels('SMPARCOL').hotel_offers
        #
        def hotel_offers
          Amadeus::Namespaces::Shopping::Hotel::HotelOffers.new(
            client, @hotel_id
          )
        end
      end
    end
  end
end
