module Amadeus
  class Client
    # A base namespaced client
    class Base
      # The +Amadeus::Client+ instance used to make API calls
      attr_reader :client

      # Initialize the namespaced client with an
      # Amadeus::Client instance
      def initialize(client)
        if client.nil? || !client.instance_of?(Amadeus::Client)
          raise(ArgumentError, 'Missing required parameter: Amadeus::Client')
        end
        @client = client
      end
    end
  end
end
