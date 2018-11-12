# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      class Analytics
        class AirTraffic
          # A namespaced client for the
          # +/v1/travel/analytics/air-traffic/searched+ endpoints
          #
          # Access via the +Amadeus::Client+ object
          #
          #   amadeus = Amadeus::Client.new
          #   amadeus.travel.analytics.air_traffic.searched
          #
          class Searched < Amadeus::Client::Decorator
            # Returns a list of air traffic reports, based on searches.
            #
            # @option params [String] :originCityCode
            # IATA code of the origin city -
            #   e.g. MAD for Madrid - required
            # @option params [String] :marketCountryCode
            # IATA code of the country from which the searches were made -
            #   e.g. ES for Spain - required
            # @option params [String] :searchPeriod when consumers
            # are searching -
            #   in YYYY-MM format - required
            # @return [Amadeus::Response] a parsed response
            # @raise [Amadeus::Base] an exception if the call failed
            # @example Which were the most searched flight destinations
            # from Madrid in August 2017?
            #   amadeus.travel.analytics.air_traffic.searched.get(
            #     originCityCode: 'MAD',
            #     searchPeriod: '2017-08',
            #     marketCountryCode: 'ES'
            #   )
            #
            def get(params = {})
              client.get('/v1/travel/analytics/air-traffic/searched', params)
            end
          end
        end
      end
    end
  end
end
