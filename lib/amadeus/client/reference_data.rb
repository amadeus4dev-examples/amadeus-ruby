module Amadeus
  class Client
    # A namespaced client for the
    # +/v2/reference_data+ endpoints
    class ReferenceData
      attr_reader :client

      # Access via the +Amadeus::Client++ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.reference_data
      #
      def initialize(client)
        @client = client
      end
    end
  end
end
