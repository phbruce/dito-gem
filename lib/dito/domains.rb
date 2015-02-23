module Dito
  def self.domains module_name
    domains = {
      :js => 'js',
      :analytics => 'analytics',
      :login => 'login',
      :events => 'events',
      :share => 'share',
      :comments => 'comments',
      :ranking => 'ranking',
      :badge => 'badge',
      :notification => 'notification'
    }
  
    if domains[module_name.to_sym].present?
      name = domains[module_name.to_sym]
  
      url = case @configuration.environment
        when "production"
          "https://#{name}.plataformasocial.com.br"
        when "development" 
          "http://#{name}.dev.plataformasocial.com.br"
        when "test"
          "http://#{name}.dev.plataformasocial.com.br"
        when "staging"
          "http://#{name}.dev.plataformasocial.com.br"
        end
        
      url
    end
  end
end