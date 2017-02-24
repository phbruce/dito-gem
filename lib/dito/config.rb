# -*- encoding : utf-8 -*-

module Dito
  module Config
    extend self

    attr_accessor :api_key, :secret
    attr_writer :environment

    def environment
      @environment ||= 'production'
    end
  end
end
