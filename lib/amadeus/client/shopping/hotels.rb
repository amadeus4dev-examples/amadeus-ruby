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
      end
    end
  end
end
