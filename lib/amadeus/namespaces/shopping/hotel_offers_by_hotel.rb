# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Shopping
      # A namespaced client for the
      # +/v2/shopping/hotel-offers/by-hotel+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.hotel_offers
      #
      class HotelOffersByHotel < Amadeus::Client::Decorator
        # Get the different offers for a dedicated hotel
        #
        # @option params [String] :hotelId Amadeus Property Code (8 chars)
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example Get all offers for Holiday Inn Paris Notre Dame
        #   amadeus.shopping.hotel_offers_by_hotel.get(
        #     hotelId: 'XKPARC12'
        #   )
        #
        def get(params = {})
          client.get('/v2/shopping/hotel-offers/by-hotel', params)
        end
      end
    end
  end
end
