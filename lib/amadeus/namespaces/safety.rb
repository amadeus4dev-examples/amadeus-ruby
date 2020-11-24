# frozen_string_literal: true

module Amadeus
  module Namespaces
    # A namespaced client for the
    # +/v1/safety+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.safety
    #
    class Safety < Amadeus::Client::Decorator
      # The namespace for the Safety APIs:
      #
      # @return [Amadeus::Namespaces::Safety::SafetyRetedLocations]
      # @example
      #   amadeus.safety.safety_rated_locations
      #
      def safety_rated_locations
        Amadeus::Namespaces::Safety::SafetyRatedLocations.new(client)
      end

      #
      # @return [Amadeus::Namespaces::Safety::SafetyRetedLocation]
      # @example
      #   amadeus.safety.safety_rated_location
      #
      def safety_rated_location(location_id)
        Amadeus::Namespaces::Safety::SafetyRatedLocation.new(client, location_id)
      end
    end
  end
end
