# -*- encoding : utf-8 -*-

module Dito
  def self.identify user = {}
    Dito.symbolize_keys!(user)
    
    params = {}

    if user[:facebook_id].present?
      network_name = 'facebook'
      id = user[:facebook_id]
      params[:network_name] = 'fb'
    elsif user[:google_plus_id].present?
      network_name = 'plus'
      id = user[:google_plus_id]
      params[:network_name] = 'pl'
    elsif user[:twitter_id].present?
      network_name = 'twitter'
      id = user[:twitter_id]
      params[:network_name] = 'tw'
    elsif user[:id].present?
      network_name = 'portal'
      id = user[:id]
      params[:network_name] = 'pt'
    else
      return { :error => { :message => 'Missing the user id param. See the available options here: http://developers.dito.com.br/docs/sdks/ruby' } }
    end

    params[:user_data] = {}

    if network_name == 'portal'
      params[:user_data].merge!(user)
      params[:user_data].delete(:id)
    else
      params[:user_data][:data] = user[:data]
    end

    if params[:user_data][:data].present? && params[:user_data][:data].is_a?(Hash)
      params[:user_data][:data] = params[:user_data][:data].to_json
    end

    params[:access_token] = user[:access_token] if user[:access_token].present?
    params[:signed_request] = user[:signed_request] if user[:signed_request].present?
    params[:id_token] = user[:id_token] if user[:id_token].present?

    Dito::Request.post 'login', "/users/#{network_name}/#{id}/signup", params
  end
end