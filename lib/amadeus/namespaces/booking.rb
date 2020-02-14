# frozen_string_literal: true

module Amadeus
  module Namespaces
    # A namespaced client for the
    # +/v1/booking+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.booking
    #
    class Booking < Amadeus::Client::Decorator
      # The namespace for the Booking APIs:
      #
      # @return [Amadeus::Namespaces::Booking::HotelBookings]
      # @example
      #   amadeus.booking.hotel_bookings
      #
      def hotel_bookings
        Amadeus::Namespaces::Booking::HotelBookings.new(client)
      end
    end
  end
end
