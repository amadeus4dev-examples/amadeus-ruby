require 'amadeus/client/request/hash'

module Amadeus
  # A wrapper for making a HTTP request. Builds the Net:HTTPRequest object
  # and starts the API call
  class Request
    include Amadeus::Request::Hash

    # The Amadeus::Client that will make the API call
    # @return [Amadeus::Client]
    attr_reader :client
    # The GET/POST params for the API call
    # @return [Hash]
    attr_reader :params
    # The path of the API to be called
    # @return [String]
    attr_reader :path
    # The verb used to make an API call (:GET or :POST)
    # @return [Symbol]
    attr_reader :verb
    # The initialized bearer token. This will be nil if no
    # +Amadeus:AccessToken+ was passed in
    # @return [String]
    attr_reader :bearer_token
    # The initialized User Agent header
    attr_reader :user_agent

    # Initialize a Request, ready to make an API call.
    #
    # @param [Amadeus::Client] client The Amadeus::Client that will make the
    #   API call
    # @param [Symbol] verb The verb used to make an API call (:GET or :POST)
    # @param [String] path The path of the API to be called
    # @param [Hash] params The GET/POST params for the API call
    # @param [Amadeus::AcessToken] access_token An initialized
    #   Amadeus::AccessToken object to use
    #
    # @return [Amadeus::Request]
    def initialize(client, verb, path, params, access_token)
      @client = client
      @verb = verb
      @path = path
      @params = params
      @access_token = access_token
      @bearer_token = @access_token.bearer_token if @access_token

      @uri = build_uri
      @request = build_request
      @user_agent = build_user_agent
    end

    # Execute the API call
    #
    # @return [Amadeus::Response]
    def call
      log_request
      fetch(@uri, @request)
    end

    # Build a new +Amadeus::Request+ with all the same argument as
    # this request and merging in the provided params to the existing ones.
    #
    # @param [Hash] params The parameters to merge into the existing ones
    #
    # @return [Amadeus::Request]
    def merge(params)
      new_params = @params.merge(params)
      Amadeus::Request.new(@client, @verb, @path, new_params,
                           @access_token)
    end

    private

    # Builds the URI object
    def build_uri
      uri = URI("#{@client.host}#{@path}")
      params = flatten_keys(@params)
      uri.query = URI.encode_www_form(params) if @verb == :GET
      uri
    end

    # Builds the request object
    def build_request
      request = request_for_verb
      add_post_data(request)
      add_bearer_token(request)
      add_user_agent(request)
      request
    end

    def request_for_verb
      method = @verb == :GET ? Net::HTTP::Get : Net::HTTP::Post
      method.new(@uri)
    end

    def add_post_data(request)
      return unless @verb == :POST
      request.form_data = @params
    end

    def add_bearer_token(request)
      return if @bearer_token.nil?
      request['Authorization'] = @bearer_token
    end

    def add_user_agent(request)
      request['User-Agent'] = @user_agent
    end

    def build_user_agent
      user_agent = "amadeus-ruby/#{Amadeus::VERSION} ruby/#{RUBY_VERSION}"
      return user_agent unless @client.custom_app_id
      user_agent + " #{@client.custom_app_id}/#{@client.custom_app_version}"
    end

    # Makes the actual API call using the URL and request objects
    def fetch(uri, request)
      ssl = uri.scheme == 'https'
      @client.http.start(uri.hostname, uri.port, use_ssl: ssl) do |http|
        http.request(request)
      end
    rescue StandardError => error
      raise(Amadeus::Errors::NetworkError, error)
    end

    # Logs the request to be made
    def log_request
      @client.logger.debug(self.class.name) { "#{@verb} #{@path}" }
      @client.logger.debug(self.class.name) { JSON.pretty_generate(@params) }
      @client.logger.debug(self.class.name) { @bearer_token.inspect }
    end
  end
end
