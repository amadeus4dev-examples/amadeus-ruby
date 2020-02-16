# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      class Predictions
        # A namespaced client for the
        # +/v1/travel/predictions/trip_purpose+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.travel.predictions.trip_purpose
        #
        class TripPurpose < Amadeus::Client::Decorator
          # Predicts traveler purpose, Business or Leisure,
          #    with the probability in the context of search & shopping
          # @option params [String] :originLocationCode the City/Airport IATA code from which
          #    the flight will depart. ``"NYC"``, for example for New York - required
          # @option params [String] :destinationLocationCode the City/Airport IATA code to which
          #    the flight is going. ``"MAD"``, for example for Madrid - required
          # @option params [String] :departureDate the date on which to fly out,
          #    in `YYYY-MM-DD` format - required
          # @option params [String] :returnDate date on which the flight returns to the origin,
          #    in `YYYY-MM-DD` format - required
          # @option params [String] :searchDate date on which the traveler performs the search,
          #    in `YYYY-MM-DD` format.
          #    If it is not specified the current date will be used - optional
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call failed
          # @example what is the name of airline code 'U2'
          #   amadeus.travel.predictions.trip_purpose.get(
          #                   originLocationCode: 'NYC',
          #                   destinationLocationCode: 'MAD',
          #                   departureDate: '2020-08-01',
          #                   returnDate: '2020-08-12',
          #                   searchDate: '2020-06-11')
          #
          def get(params = {})
            client.get('/v1/travel/predictions/trip-purpose', params)
          end
        end
      end
    end
  end
end
