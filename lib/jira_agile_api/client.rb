module JiraAgileApi
  class Client
    USER_AGENT          = "Ruby/#{RUBY_VERSION} (#{RUBY_PLATFORM}; #{RUBY_ENGINE}) JiraAgileApi/#{JiraAgileApi::VERSION} Faraday/#{Faraday::VERSION}".freeze

    # Header keys that can be passed in options hash to {#get},{#paginate}
    CONVENIENCE_HEADERS = Set.new([:accept, :content_type])

    attr_reader :url, :api_version, :username, :password, :oauth, :logger, :connection, :auto_paginate, :last_response

    # Create Pivotal Tracker API client.
    #
    # @param [Hash] options the connection options
    # @option options [Hash] :oauth Options are forwarded by Faraday oauth middleware to SimpleOAuth::Header.
    #   Common options are: :consumer_key, :consumer_secret, :token, :token_secret, :signature_method
    # @option options [String] :username Username to use for Basic Auth
    # @option options [String] :password Password to use for Basic Auth
    # @option options [String] :url Main HTTP API root
    # @option options [Boolean] :auto_paginate Client should perform pagination automatically. Default true.
    # @option options [String] :api_version The API version URL path
    # @option options [String] :logger Custom logger
    # @option options [String] :adapter Custom http adapter to configure Faraday with
    # @option options [String] :connection_options Connection options to pass to Faraday
    #
    # @example Creating a Client
    #   Client.new username: 'sally', password: 'brown'
    #
    # @example Creating a Client with oauth parameters
    #   Client.new oauth: { consumer_key: 'xxx', consumer_secret: 'yyy', token: 'zzz', token_secret: '123', signature_method: 'RSA-SHA1' }
    def initialize(options={})
      url                = options.fetch(:url, 'https://jira.atlassian.com/jira')
      @url               = Addressable::URI.parse(url).to_s
      @api_version       = options.fetch(:api_version, '/rest/greenhopper/1.0')
      @logger            = options.fetch(:logger, ::Logger.new(nil))
      adapter            = options.fetch(:adapter, :excon)
      connection_options = options.fetch(:connection_options, { ssl: { verify: true } })
      # @auto_paginate     = options.fetch(:auto_paginate, true)
      # @token             = options[:token]
      @oauth              = options[:oauth]
      @username           = options[:username]
      @password           = options[:password]

      if @oauth
        authentication_options = [:oauth, @oauth]
      else
        raise 'Missing required option: username' unless @username
        raise 'Missing required option: password' unless @password

        authentication_options = [:basic_auth, @username, @password]
      end

      @connection = Faraday.new({ url: @url }.merge(connection_options)) do |builder|
        # response
        builder.use Faraday::Response::RaiseError
        builder.response :json

        # request
        builder.request :multipart
        builder.request :json
        builder.request *authentication_options

        builder.use JiraAgileApi::Logger, @logger
        builder.adapter adapter
      end
    end

    # Make a HTTP GET request
    #
    # @param path [String] The path, relative to api endpoint
    # @param options [Hash] Query and header params for request
    # @return [Faraday::Response]
    def get(path, options = {})
      request(:get, parse_query_and_convenience_headers(path, options))
    end

    # Make a HTTP POST request
    #
    # @param path [String] The path, relative to api endpoint
    # @param options [Hash] Query and header params for request
    # @return [Faraday::Response]
    def post(path, options = {})
      request(:post, parse_query_and_convenience_headers(path, options))
    end

    # Get all rapid views visible to the session user.
    #
    # @param [Hash] params
    # @return [Array[JiraAgileApi::Resources::RapidView]]
    def rapid_views(params={})
      Endpoints::RapidViews.new(self).get(params)
    end

    # Get the rapid view with the given ID.
    #
    # @param [Fixnum] id Rapid View ID
    # @param [Hash] params
    # @return [Array[JiraAgileApi::Resources::RapidView]]
    def rapid_view(id, params={})
      Endpoints::RapidView.new(self).get(id, params)
    end

    private

    def parse_query_and_convenience_headers(path, options)
      raise 'Path can not be blank.' if path.to_s.empty?

      opts = { body: options[:body] }

      opts[:url]    = options[:url] || File.join(@url, @api_version, path.to_s)
      opts[:method] = options[:method] || :get
      opts[:params] = options[:params] || {}
      headers       = { 'User-Agent' => USER_AGENT }.merge(options.fetch(:headers, {}))

      CONVENIENCE_HEADERS.each do |h|
        if header = options[h]
          headers[h] = header
        end
      end
      opts[:headers] = headers

      opts
    end

    def request(method, options = {})
      url     = options.fetch(:url)
      params  = options[:params] || {}
      body    = options[:body]
      headers = options[:headers]

      @last_response = response = connection.send(method) do |req|
        req.url(url)
        req.headers.merge!(headers)
        req.params.merge!(params)
        req.body = body
      end
      response
    rescue Faraday::Error::ClientError => e
      raise JiraAgileApi::Error.new(e)
    end
  end
end
