# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Analytics
      # A namespaced client for the
      # +/v1/analytics/itinerary-price-metrics+ endpoint
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.analytics.itinerary_price_metrics
      #
      class ItineraryPriceMetrics < Amadeus::Client::Decorator
        # Returns historical flight prices by date and route so you can see how current ticket
        # prices stack up against the historical average
        #
        # @option params [String] :originIataCode IATA code of the airport to depart from
        # @option params [String] :destinationIataCode IATA code of the airport to arrive at
        # @option params [String] :departureDate date to depart on, formatted as YYYY-MM-DD
        # @option params [String] :currencyCode the preferred currency (ISO 4217) - optional
        # @option params [Boolean] :oneWay retrieve prices for one-way only - optional
        # @return [Amadeus::Response] a parsed response
        # @raise [Amadeus::Base] an exception if the call failed
        # @example
        #   amadeus.analytics.itinerary_price_metrics.get(
        #     originIataCode: 'AMS',
        #     destinationIataCode: 'CDG',
        #     departureDate: '2021-06-18'
        #   )
        #
        def get(params = {})
          client.get('/v1/analytics/itinerary-price-metrics', params)
        end
      end
    end
  end
end
