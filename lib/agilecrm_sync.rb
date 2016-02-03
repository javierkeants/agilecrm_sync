require "agilecrm_sync/version"
require "agilecrm_sync/config"

module AgilecrmSync

  class << self
  	
    attr_accessor :config

    def config
      @config ||= Config.new
    end

    def reset
      @config = Config.new
    end

    def configure
      yield(config)
    end

    def endpoint
      "https://#{config.domain}.agilecrm.com/dev/api"
    end

    def connection
      @connection ||= default_connection
    end

    def default_connection
      options = {
        headers: { 'Accept' => 'application/json' }
      }
      Faraday.new(endpoint, options) do |conn|
        conn.request(:json)
        conn.request(:basic_auth, config.email, config.api_key)
        conn.response(:json, content_type: /\bjson$/)
        conn.response(:agilecrm_error)
        conn.response :logger, ::Logger.new(STDOUT), bodies: true
        conn.adapter(Faraday.default_adapter)
      end
    end
  end

end
