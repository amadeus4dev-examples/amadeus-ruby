# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      class Analytics
        # A namespaced client for the
        # +/v1/travel/analytics/air_traffic+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.travel.analytics.air_traffic
        #
        class AirTraffic < Amadeus::Client::Decorator
          # The namespace for the Traveled API:
          #
          # @return
          #   [Amadeus::Namespaces::Travel::Analytics::AirTraffic::Traveled]
          # @example
          #   amadeus.travel.analytics.air_traffic.traveled
          #
          def traveled
            Amadeus::Namespaces::Travel::Analytics::AirTraffic::Traveled.new(
              client
            )
          end
        end
      end
    end
  end
end
