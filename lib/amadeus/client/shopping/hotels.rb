module Amadeus
  class Client
    class Shopping
      # A namespaced client for the
      # +/v1/shopping/hotels+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.hotels
      #
      class Hotels < Amadeus::Client::Base
        # The namespace for the hotels offers API:
        #
        #   amadeus.shopping.hotels,offers
        #
        def offers
          Amadeus::Client::Shopping::Hotels::Offers.new(client)
        end
      end
    end
  end
end
