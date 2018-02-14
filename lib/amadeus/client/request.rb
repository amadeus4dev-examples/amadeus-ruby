require 'amadeus/client/request/hash'

module Amadeus
  # A Request object containing all the compiled information about this request.
  class Request
    include Amadeus::Request::Hash

    # The host used for this API call
    # @return [String]
    attr_reader :host
    # The port for this API call. Standard set to 443.
    # @return [Number]
    attr_reader :port
    # The GET/POST params for the API call
    # @return [Hash]
    attr_reader :params
    # The path of the API to be called
    # @return [String]
    attr_reader :path
    # The verb used to make an API call (:GET or :POST)
    # @return [Symbol]
    attr_reader :verb
    # The bearer token (if any) that is used for authentication
    # @return [String]
    attr_reader :bearer_token
    # The library version used for this request
    # @return [String]
    attr_reader :client_version
    # The Ruby language version used for this request
    # @return [String]
    attr_reader :language_version
    # The custom app ID passed in for this request
    # @return [String]
    attr_reader :app_id
    # The custom app version used for this request
    # @return [String]
    attr_reader :app_version

    # A Request object containing all the compiled information about
    # this request.
    #
    # @return [Amadeus::Request]
    # @!visibility private
    def initialize(options)
      initialize_options(options)
      initialize_headers
    end

    # Builds the URI object
    def uri
      uri = URI("#{@host}#{@path}")
      params = flatten_keys(@params)
      uri.query = URI.encode_www_form(params) if @verb == :GET
      uri
    end

    # Builds the request object
    def http_request
      request = request_for_verb
      add_post_data(request)
      add_bearer_token(request)
      add_headers(request)
      request
    end

    private

    def initialize_options(options)
      @host           = options[:host]
      @port           = 443
      @verb           = options[:verb]
      @path           = options[:path]
      @params         = options[:params]
      @bearer_token   = options[:bearer_token]
      @client_version = options[:client_version]
      @language_version = options[:language_version]
      @app_id         = options[:app_id]
      @app_version    = options[:app_version]
    end

    def initialize_headers
      @headers        = {
        'User-Agent' => build_user_agent,
        'Accept' => 'application/json'
      }
    end

    def request_for_verb
      method = @verb == :GET ? Net::HTTP::Get : Net::HTTP::Post
      method.new(uri)
    end

    def add_post_data(request)
      return unless @verb == :POST
      @headers['Content-Type'] = 'application/x-www-form-urlencoded'
      request.form_data = @params
    end

    def add_bearer_token(_request)
      return if @bearer_token.nil?
      @headers['Authorization'] = @bearer_token
    end

    def add_headers(request)
      @headers.each do |key, value|
        request[key] = value
      end
    end

    def build_user_agent
      user_agent = "amadeus-ruby/#{@client_version} ruby/#{@language_version}"
      return user_agent unless @app_id
      user_agent + " #{@app_id}/#{@app_version}"
    end
  end
end
