# -*- encoding : utf-8 -*-

require "helpers/symbolize_keys"

require "dito/version"
require "dito/configuration"
require "dito/domains"
require "dito/request"
require "dito/identify"
require "dito/track"

module Dito
  def self.root
    File.expand_path '../..', __FILE__
  end

  class << self
    def configuration
      @configuration ||= Configuration.new
    end
    
    def configure
      yield(configuration)
    end

    def api_key
      configuration.api_key
    end

    def secret
      configuration.secret
    end

    def environment
      configuration.environment
    end
  end
end
