# -*- encoding : utf-8 -*-

module Dito
  def self.alias(options = {})
    Dito.symbolize_keys!(options)

    settings = Dito.generate_alias_settings(options)

    return { :error => settings[:error] } if settings[:error].present?

    Dito::Request.post 'login', "/users/#{settings[:id]}/link", settings[:params]
  end

  def self.unalias(options = {})
    Dito.symbolize_keys!(options)
    
    settings = Dito.generate_alias_settings(options)
    
    return { :error => settings[:error] } if settings[:error].present?

    Dito::Request.post 'login', "/users/#{settings[:id]}/unlink", settings[:params]
  end

  def self.generate_alias_settings(options = {})
    id, id_type = Dito.generate_credentials(options)

    return { :error => { :message => 'Missing the user id param. See the available options here: http://developers.dito.com.br/docs/sdks/ruby' } } if id.blank?
    return { :error => { :message => 'Missing the accounts param. See the available options here: http://developers.dito.com.br/docs/rest-api/users' } } if options[:accounts].blank?

    params = { :accounts => options[:accounts] }
    params[:id_type] = id_type if id_type.present?

    { :id => id, :params => params }
  end
end