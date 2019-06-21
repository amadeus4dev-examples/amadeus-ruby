# frozen_string_literal: true

module Amadeus
  module Namespaces
    class EReputation
      # A namespaced client for the
      # +/v2/e-reputation/hotel-sentiments+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.e_reputation.hotel_sentiments
      #
      class HotelSentiments < Amadeus::Client::Decorator
        # For a given list of hotels, returns the sentiment analysis of each hotel
        #
        # @option params [String] :hotelIds list of hotel ids separated by comas
        # @return [Amadeus:Response] a parsed response
        # @raise [Amadeus:Base] an exception if the call failed
        # @example Search for hotels in London
        #   amadeus.e_reputation.hotel_sentiments.get(
        #     hotelIds: 'GUNYCAXZ,CTLONCMB'
        #   )
        #
        def get(params = {})
          client.get('/v2/e-reputation/hotel-sentiments', params)
        end
      end
    end
  end
end
