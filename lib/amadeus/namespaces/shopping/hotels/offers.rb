# frozen_string_literal: true

module Amadeus
  module Namespaces
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
        class Offers < Amadeus::Client::Decorator
          # the Hotel ID
          attr_reader :hotel_id
          # the Offer ID
          attr_reader :offer_id

          # Initialize this namespaced client with an
          # {Amadeus::Client} instance, a Hotel ID, and an Offer ID
          #
          # @param [Amadeus::Client] client
          # @param [Number] hotel_id
          # @param [Number] offer_id
          #
          def initialize(client, hotel_id, offer_id)
            super(client)
            @hotel_id = hotel_id
            @offer_id = offer_id
          end

          # Get room and rate details
          #
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call failed
          # @example Search for hotels in London
          #   amadeus.shopping.hotels('SMPARCOL').offers('AC7D4DA2C322A73AF0824318A4965DA2805A3FC2').get
          #
          def get(params = {})
            @offer_id ||= begin
              offer_id = params[:id] || params['id']
              params.delete(:id)
              params.delete('id')
              offer_id
            end

            client.get(
              "/v1/shopping/hotels/#{@hotel_id}/offers/#{@offer_id}", params
            )
          end
        end
      end
    end
  end
end
