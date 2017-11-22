module Amadeus
  class Client
    class Shopping
      class Hotels
        # A namespaced client for the
        # +/v1/shopping/hotels/:id/offers+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.shopping.hotels.offers
        #
        class Offers < Amadeus::Client::Base
        end
      end
    end
  end
end
