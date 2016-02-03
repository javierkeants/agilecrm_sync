module AgilecrmSync
  class Config

    attr_accessor :domain, :api_key, :email

    def initialize
      @domain = ''
      @api_key = ''
      @email = ''
    end

  end
end