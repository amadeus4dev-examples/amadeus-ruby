# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      class Analytics
        # A namespaced client for the
        # +/v1/travel/analytics/fare-searches+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.travel.analytics.fare_searches
        #
        class FareSearches < Amadeus::Client::Decorator
          # The Fare Search History API allows to find the number of
          # estimated searches from an origin, optionally a destination,
          # within a time period when travelers are performing the searches.
          #
          # @option params [String] :origin IATA code of the origin city
          #   e.g. BOS for Boston - required
          # @option params [String] :sourceCountry IATA code of the
          #  country from which fare searches were made - e.g. US for
          #  United States
          # @option params [String] :period period of search; can be a year
          #   or a month or a week. ISO format must be used - e.g. 2015
          #   for year; 2015-05 for month and 2015-W04 for week. Period
          #   ranges are not supported. Only periods from year 2011-01 up
          #   to current year and previous month or week are valid. Future
          #   dates are not supported.
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call failed
          # @example Find the fare searches for Nice, made from France in August 2017
          #   amadeus.travel.analytics.fare_searches.get(
          #     origin: 'NCE',
          #     sourceCountry: 'FR'
          #     period: '2017-08'
          #   )
          def get(params = {})
            client.get('/v1/travel/analytics/fare-searches', params)
          end
        end
      end
    end
  end
end
