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
        # The namespace for the AirTraffics API:
        #
        # @return [Amadeus::Namespaces::Travel::Analytics::AirTraffics]
        # @example
        #   amadeus.travel.analytics.air_traffics
        #
        def air_traffics
          Amadeus::Namespaces::Travel::Analytics::AirTraffics.new(client)
        end

        # The namespace for the FareSearches API:
        #
        # @return [Amadeus::Namespaces::Travel::Analytics::FareSearches]
        # @example
        #   amadeus.travel.analytics.fare_searches
        #
        def fare_searches
          Amadeus::Namespaces::Travel::Analytics::FareSearches.new(client)
        end
      end
    end
  end
end
