# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Amadeus::Namespaces::Booking::HotelBookings do
  before do
    @client = double('Amadeus::Client')
    @api = Amadeus::Namespaces::Booking::HotelBookings.new(@client)
  end

  describe '.post' do
    it 'should call client.post with the right body' do
      hotel_offer_id = { foo: :bar }
      pay_info = { foo: :bar }
      guests_info = [{ foo: :bar }, { foo: :bar }]

      body = {
        'data' => {
          'offerId' => { foo: :bar },
          'guests' => [{ foo: :bar }, { foo: :bar }],
          'payments' => [{ foo: :bar }]
        }
      }
      expect(@client).to receive(:post).with(
        '/v1/booking/hotel-bookings', body.to_json
      )

      @api.post(hotel_offer_id, guests_info, pay_info)
    end
  end
end
