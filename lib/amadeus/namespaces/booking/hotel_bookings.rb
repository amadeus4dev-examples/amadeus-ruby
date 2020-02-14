# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Booking
      # A namespaced client for the
      # +/v1/booking/hotel_bookings+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.booking.hotel_bookings
      #
      class HotelBookings < Amadeus::Client::Decorator
        # Book a specific room
        #
        # The parameters guests and payments can be passed as dictionary
        # or list of dictionaries. If they are dictionary in this method they are
        # converted to a list of dictionaries.
        #
        # @option params [String] :hotelIds list of hotel ids separated by comas
        # @return [Amadeus:Response] a parsed response
        # @raise [Amadeus:Base] an exception if the call failed
        # @example book for a hotel offer
        #  amadeus.booking.hotel_bookings.post(
        #     hotel_offer_id, guests, payments
        #   )
        #
        def post(hotel_offer_id, guests, payments)
          body = prepare_body(hotel_offer_id, guests, payments)

          client.post('/v1/booking/hotel-bookings', body.to_json)
        end

        def prepare_body(hotel_offer_id, guests, payments)
          guests_info = [], pay_info = []

          guests.is_a?(Array) ? guests_info.push(guests).flatten! : guests_info.push(guests)
          payments.is_a?(Array) ? pay_info.push(payments).flatten! : pay_info.push(payments)

          {
            'data' => {
              'offerId' => hotel_offer_id,
              'guests' => guests_info,
              'payments' => pay_info
            }
          }
        end
      end
    end
  end
end
