# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      class Analytics
        class AirTraffic
          # A namespaced client for the
          # +/v1/travel/analytics/air-traffic/booked+ endpoints
          #
          # Access via the +Amadeus::Client+ object
          #
          #   amadeus = Amadeus::Client.new
          #   amadeus.travel.analytics.air_traffic.booked
          #
          class Booked < Amadeus::Client::Decorator
            # Returns a list of air traffic reports, based on bookings.
            #
            # @option params [String] :originCityCode
            # IATA code of the origin city -
            #   e.g. BOS for Boston - required
            # @option params [String] :period period when consumers
            # are booking
            #   in YYYY-MM format - required
            # @return [Amadeus::Response] a parsed response
            # @raise [Amadeus::Base] an exception if the call failed
            # @example Find the air traffic from Nice in August 2017
            #   amadeus.travel.analytics.air_traffic.booked.get(
            #     originCityCode: 'NCE',
            #     period: '2017-08'
            #   )
            #
            def get(params = {})
              client.get('/v1/travel/analytics/air-traffic/booked', params)
            end
          end
        end
      end
    end
  end
end
