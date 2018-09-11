# frozen_string_literal: true

module Amadeus
  class Client
    # A superclass that allows any namespaced superclass
    # to easily wrap the client object
    #
    # @abstract
    # @!visibility private
    class Decorator
      # The API client
      # @return [Amadeus::Client]
      attr_reader :client

      # Initialize the namespaced client with an
      # {Amadeus::Client} instance
      #
      # @param [Amadeus::Client] client
      def initialize(client)
        if client.nil?
          raise(ArgumentError, 'Missing required parameter: Amadeus::Client')
        end

        @client = client
      end
    end
  end
end
