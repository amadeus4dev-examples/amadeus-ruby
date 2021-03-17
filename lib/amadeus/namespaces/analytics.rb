# frozen_string_literal: true

module Amadeus
  module Namespaces
    # A namespaced client for the
    # +/v1/analytics+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.analytics
    #
    class Analytics < Amadeus::Client::Decorator
      # The namespace for the Analytics-ItineraryPriceMetrics API:
      #
      # @return [Amadeus::Namespaces::Analytics::ItineraryPriceMetrics]
      # @example
      #   amadeus.analytics.itinerary_price_metrics
      #
      def itinerary_price_metrics
        Amadeus::Namespaces::Analytics::ItineraryPriceMetrics.new(client)
      end
    end
  end
end
