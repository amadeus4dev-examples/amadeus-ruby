module Amadeus
  class Client
    # A superclass that allows any namespaced superclass
    # to easily wrap the client object
    class Decorator
      # The +Amadeus::Client+ instance used to make API calls
      attr_reader :client

      # Initialize the namespaced client with an
      # Amadeus::Client instance
      def initialize(client)
        if client.nil?
          raise(ArgumentError, 'Missing required parameter: Amadeus::Client')
        end
        @client = client
      end
    end
  end
end
