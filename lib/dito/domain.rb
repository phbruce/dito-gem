# -*- encoding : utf-8 -*-

module Dito
  # lib/dito/domain.rb
  class Domain
    DOMAIN_PATH = File.expand_path('../../../config/domains.yml', __FILE__)

    def initialize(service_name)
      @service_name = service_name
    end

    def url
      domain % @service_name if Service.new(@service_name).valid?
    end

    private

    def domain
      YAML.load_file(DOMAIN_PATH)[Config.environment]
    end
  end
end
