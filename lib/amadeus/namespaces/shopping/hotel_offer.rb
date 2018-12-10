# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Shopping
      # A namespaced client for the
      # +/v2/shopping/hotel-offers/:offer_id+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping.hotel_offer('XXXX')
      #
      class HotelOffer < Amadeus::Client::Decorator
        # the Offer ID
        attr_reader :offer_id

        # Initialize this namespaced client with an
        # {Amadeus::Client} instance and an Offer ID
        #
        # @param [Amadeus::Client] client
        # @param [Number] offer_id
        #
        def initialize(client, offer_id)
          super(client)
          @offer_id = offer_id
        end

        # Return all available details of a specific hotel offer
        #
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example
        #   amadeus.shopping.hotel_offer('XXXX').get
        #
        def get(params = {})
          client.get("/v2/shopping/hotel_offers/#{@offer_id}", params)
        end
      end
    end
  end
end
