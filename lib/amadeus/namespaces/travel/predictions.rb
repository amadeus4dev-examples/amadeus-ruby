# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      # A namespaced client for the
      # +/v1/travel/predictions+ endpoints
      #
      # Access via the +Amadeus::Client+ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.travel.predictions
      #
      class Predictions < Amadeus::Client::Decorator
        # The namespace for the travel Predictions APIs:
        #
        # @return [Amadeus::Namespaces::Travel::Predictions]
        # @example
        #   amadeus.travel.predictions.trip_purpose
        #
        def trip_purpose
          Amadeus::Namespaces::Travel::Predictions::TripPurpose.new(client)
        end

        # The namespace for the travel Predictions APIs:
        #
        # @return [Amadeus::Namespaces::Travel::Predictions]
        # @example
        #   amadeus.travel.predictions.flight_delay
        #
        def flight_delay
          Amadeus::Namespaces::Travel::Predictions::FlightDelay.new(client)
        end
      end
    end
  end
end
