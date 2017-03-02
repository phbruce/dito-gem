# -*- encoding : utf-8 -*-

module Dito
  # lib/dito/service.rb
  class Service
    SERVICES_PATH = File.expand_path('../../../config/services.yml', __FILE__)

    def initialize(service_name)
      @service_name = service_name
    end

    def valid?
      services.include?(@service_name)
    end

    private

    def services
      YAML.load_file(SERVICES_PATH)['services']
    end
  end
end
