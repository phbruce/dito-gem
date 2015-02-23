module Dito
  class Configuration
    attr_accessor :api_key, :secret
    attr_writer :environment

    def environment
      @environment || 'production'
    end
  end
end