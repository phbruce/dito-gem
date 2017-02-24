# -*- encoding : utf-8 -*-

module Dito
  # lib/dito/domain.rb
  class Domain
    DITO_MODULES = {
      notification: 'notification', analytics: 'analytics',  badge: 'badge',
      comments: 'comments', ranking: 'ranking', events: 'events', js: 'js',
      share: 'share', login: 'login', js: 'js'
    }.freeze

    def initialize(module_name)
      @module_name = module_name.to_sym
    end

    def url
      mount_url if DITO_MODULES[@module_name].present?
    end

    private

    def mount_url
      url = 'https://%s%s.plataformasocial.com.br'

      case Dito::Config.environment
        when 'production'; url % [@module_name, '']
        when 'development', 'test' 'staging'; url % %W(#{@module_name} .dev)
      end
    end
  end
end
