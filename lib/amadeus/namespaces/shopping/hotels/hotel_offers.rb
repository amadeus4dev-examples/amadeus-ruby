module Amadeus
  module Namespaces
    class Shopping
      class Hotels
        # A namespaced client for the
        # +/v1/shopping/hotels/:id/hotel-offers+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.shopping.hotels.hotel_offers
        #
        class HotelOffers < Amadeus::Client::Decorator
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

          # Get one hotel and its available offers
          #
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Errors::Base] an exception if the call failed
          # @example Search for hotels in London
          #   amadeus.hotels(123).hotel_offers.get
          #
          def get(params = {})
            client.get("/v1/shopping/hotel/#{@hotel_id}/hotel-offers", params)
          end
        end
      end
    end
  end
end
