module Amadeus
  class Client
    # A namespaced client for the
    # +/v1/shopping+ endpoints
    #
    # Access via the +Amadeus::Client+ object
    #
    #   amadeus = Amadeus::Client.new
    #   amadeus.shopping
    #
    class Shopping < Amadeus::Client::Base
    end
  end
end
