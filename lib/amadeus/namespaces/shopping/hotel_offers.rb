# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Shopping
      # A namespaced client for the
      # +/v1/shopping/hotel-offers+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.hotel_offers
      #
      class HotelOffers < Amadeus::Client::Decorator
        # Search for hotels and retrieve availability and rates information
        #
        # @option params [String] :cityCode City IATA code
        # @option params [Double] :latitude latitude of geographic location to
        #   search around. Example: 52.5238
        # @option params [Double] :longitude Longitude of geographic location to
        #   search around. Example: 13.3835
        # @option params [String] :hotels Comma separated list of Amadeus hotel
        #   codes to request. Example: RTPAR001
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example Search for hotels in London
        #   amadeus.shopping.hotel_offers.get(
        #     cityCode: 'PAR'
        #   )
        #
        def get(params = {})
          client.get('/v1/shopping/hotel-offers', params)
        end
      end
    end
  end
end
