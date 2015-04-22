# -*- encoding : utf-8 -*-

module Dito
  def self.track options = {}
    Dito.symbolize_keys!(options)

    id, id_type = Dito.generate_credentials(options)
    
    return { :error => { :message => 'Missing the user id param. See the available options here: http://developers.dito.com.br/docs/sdks/ruby' } } if id.blank?

    params = { :event => options[:event].to_json }
    params[:id_type] = id_type if id_type.present?

    Dito::Request.post 'events', "/users/#{id}/", params
  end
end