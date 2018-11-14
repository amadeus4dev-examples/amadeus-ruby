# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      class Analytics
        class AirTraffic
          # A namespaced client for the
          # +/v1/travel/analytics/air-traffic/searched_by_destination+ endpoints
          #
          # Access via the +Amadeus::Client+ object
          #
          #   amadeus = Amadeus::Client.new
          #   amadeus.travel.analytics.air_traffic.searched_by_destination
          #
          class SearchedByDestination < Amadeus::Client::Decorator
            # Returns a list of air traffic reports,
            # based on searches for a dedicated destination.
            #
            # @option params [String] :originCityCode
            # IATA code of the origin city -
            #   e.g. NCE for Nice - required
            # @option params [String] :destinationCityCode
            # IATA code of the destinaton city -
            #   e.g. PAR for Paris - required
            # @option params [String] :marketCountryCode
            # IATA code of the country from which the searches were made -
            #   e.g. FR for France - required
            # @option params [String] :searchPeriod when consumers
            # are searching -
            #   in YYYY-MM format - required
            # @return [Amadeus::Response] a parsed response
            # @raise [Amadeus::Base] an exception if the call failed
            # @example How many people in Spain searched for a trip
            # from Madrid to New-York in August 2017?
            #  amadeus.travel.analytics.air_traffic.searched_by_destination.get(
            #     originCityCode: 'MAD',
            #     destinationCityCode: 'NYC',
            #     searchPeriod: '2017-08',
            #     marketCountryCode: 'ES'
            #   )
            #
            def get(params = {})
              client.get(
                '/v1/travel/analytics/air-traffic/searched/by-destination',
                params
              )
            end
          end
        end
      end
    end
  end
end
