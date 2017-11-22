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
      class Hotels < Amadeus::Client::Decorator
        # The namespace for the Offers API:
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
