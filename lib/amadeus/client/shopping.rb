module Amadeus
  class Client
    # A namespaced client for the
    # +/v1/shopping+ endpoints
    class Shopping
      attr_reader :client

      # Access via the +Amadeus::Client++ object
      #
      #   amadeus = Amadeus::Client.new
      #   amadeus.shopping
      #
      def initialize(client)
        @client = client
      end
    end
  end
end
