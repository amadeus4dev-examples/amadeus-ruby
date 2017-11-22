module Amadeus
  class Client
    class Shopping
      # A namespaced client for the
      # +/v1/shopping/hotel_offers+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.hotel_offers
      #
      class HotelOffers < Amadeus::Client::Base
      end
    end
  end
end
