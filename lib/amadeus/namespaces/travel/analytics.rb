# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      # A namespaced client for the
      # +/v1/travel/analytics+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.travel.analytics
      #
      class Analytics < Amadeus::Client::Decorator
        # The namespace for the travel Analytics APIs:
        #
        # @return [Amadeus::Namespaces::Travel::Analytics]
        # @example
        #   amadeus.travel.analytics.air_traffic
        #   amadeus.travel.analytics.fare_searches
        #
        def air_traffic
          Amadeus::Namespaces::Travel::Analytics::AirTraffic.new(client)
        end
      end
    end
  end
end
