module Amadeus
  class Client
    # A namespaced client for the
    # +/v1/travel+ endpoints
    class Travel
      attr_reader :client

      # Access via the +Amadeus::Client++ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.travel
      #
      def initialize(client)
        @client = client
      end
    end
  end
end
