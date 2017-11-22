module Amadeus
  class Client
    class ReferenceData
      class Locations
        # A namespaced client for the
        # +/v1/reference_data/locations/airports+ endpoints
        #
        # Access via the +Amadeus::Client+ object
        #
        #   amadeus = Amadeus::Client.new
        #   amadeus.reference_data.locations.airports
        #
        class Airports < Amadeus::Client::Decorator
        end
      end
    end
  end
end
