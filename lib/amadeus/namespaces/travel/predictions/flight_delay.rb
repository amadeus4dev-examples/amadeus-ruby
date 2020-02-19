# frozen_string_literal: true

module Amadeus
  module Namespaces
    class Travel
      class Predictions
        # A namespaced client for the
        # +/v1/travel/predictions/flight_delay+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.travel.predictions.flight_delay
        #
        class FlightDelay < Amadeus::Client::Decorator
          # Forecast the chances for a flight to be delayed
          # @option params [String] :originLocationCode the Airport IATA code from which
          #    the flight will depart. ``"NYC"``, for example for New York - required
          # @option params [String] :destinationLocationCode the Airport IATA code to which
          #    the flight is going. ``"MAD"``, for example for Madrid - required
          # @option params [String] :departureDate the date on which to fly out,
          #    in `YYYY-MM-DD` format - required
          # @option params [String] :departureTime local time on which to fly out,
          #    in `HH:MM:SS` format - required
          # @option params [String] :arrivalDate date on which the flight returns to the origin,
          #    in `YYYY-MM-DD` format - required
          # @option params [String] :arrivalTime local time on which to fly out,
          #    in `HH:MM:SS` format - required
          # @option params [String] :aircraftCode IATA aircraft code - required
          # @option params [String] :carrierCode airline / carrier code - required
          # @option params [String] :flightNumber flight number - required
          # @option params [String] :duration flight duration,
          #    in `PnYnMnDTnHnMnS` format e.g. PT2H10M - required
          # @return [Amadeus::Response] a parsed response
          # @raise [Amadeus::Base] an exception if the call failed
          # @example
          #   amadeus.travel.predictions.flight_delay.get(originLocationCode: 'NCE',
          #                                               destinationLocationCode: 'IST',
          #                                                departureDate: '2020-08-01',
          #                                                departureTime: '18:20:00',
          #                                                arrivalDate: '2020-08-01',
          #                                                arrivalTime: '22:15:00',
          #                                                aircraftCode: '321',
          #                                                carrierCode: 'TK',
          #                                                flightNumber: '1816',
          #                                                duration: 'PT31H10M')
          #
          def get(params = {})
            client.get('/v1/travel/predictions/flight-delay', params)
          end
        end
      end
    end
  end
end
