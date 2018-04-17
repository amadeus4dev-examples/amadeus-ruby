# frozen_string_literal: true

module Amadeus
  module Namespaces
    # A namespaced client for the
    # +/v1/travel+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.travel
    #
    class Travel < Amadeus::Client::Decorator
      # The namespace for the travel Analytics APIs:
      #
      # @return [Amadeus::Namespaces::Travel::Analytics]
      # @example
      #   amadeus.travel.analytics.air_traffic
      #   amadeus.travel.analytics.fare_searches
      #
      def analytics
        Amadeus::Namespaces::Travel::Analytics.new(client)
      end
    end
  end
end
