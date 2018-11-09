# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      class Analytics
        class AirTraffic
          # A namespaced client for the
          # +/v1/travel/analytics/air-traffic/busiest-period+ endpoints
          #
          # Access via the +Amadeus::Client+ object
          #
          #   amadeus = Amadeus::Client.new
          #   amadeus.travel.analytics.air_traffic.busiest_period
          #
          class BusiestPeriod < Amadeus::Client::Decorator
            # Returns the months of the selected year, ordered from busiest
            # to least busy.
            #
            # @option params [String] :cityCode IATA code of the origin city -
            #   e.g. BOS for Boston - required
            # @option params [String] :period period when consumers
            #   are travelling in YYYY format - required
            # @option params [String] :direction to select between
            # arrivals and departures (default: arrivals) - required
            # @return [Amadeus::Response] a parsed response
            # @raise [Amadeus::Base] an exception if the call failed
            # @example What was the busiest travel period in 2017
            #   amadeus.travel.analytics.air_traffic.busiest_period.get(
            #     cityCode: 'MAD',
            #     period: '2017',
            #     direction: Amadeus::Direction::ARRIVING
            #   )
            #
            def get(params = {})
              client.get('/v1/travel/analytics/air-traffic/busiest-period',
                         params)
            end
          end
        end
      end
    end
  end
end
