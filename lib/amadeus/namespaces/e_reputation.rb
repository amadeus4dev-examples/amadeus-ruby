# frozen_string_literal: true

module Amadeus
  module Namespaces
    # A namespaced client for the
    # +/v2/e-reputation+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.e_reputation
    #
    class EReputation < Amadeus::Client::Decorator
      # The namespace for the E Reputation APIs:
      #
      # @return [Amadeus::Namespaces::EReputation::HotelSentiments]
      # @example
      #   amadeus.e_reputation.hotel_sentiments
      #
      def hotel_sentiments
        Amadeus::Namespaces::EReputation::HotelSentiments.new(client)
      end
    end
  end
end
