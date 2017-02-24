# -*- encoding : utf-8 -*-

require 'helpers/symbolize_keys'

require 'dito/version'
require 'dito/config'
require 'dito/domain'
require 'dito/request'
require 'dito/identify'
require 'dito/track'

module Dito
  def self.root
    File.expand_path('../..', __FILE__)
  end

  class << self
    def configure
      yield Config
    end
  end
end
