module Dito
  def self.identify user = {}
    user.symbolize_keys!
    
    params = {}

    if user[:facebook_id] || user[:fb_id]
      network_name = 'facebook'
      social_id = user[:facebook_id] || user[:fb_id]
      params[:network_name] = 'fb'
      params[:user_data] = { data: user[:data] } if user[:data]
    elsif user[:google_plus_id] or user[:plus_id]
      network_name = 'plus'
      social_id = user[:google_plus_id] || user[:plus_id]
      params[:network_name] = 'pl'
      params[:user_data] = { data: user[:data] } if user[:data]
    elsif user[:twitter_id]
      network_name = 'twitter'
      social_id = user[:twitter_id]
      params[:network_name] = 'tw'
      params[:user_data] = { data: user[:data] } if user[:data]
    else #portal
      network_name = 'portal'
      social_id = user[:id]
      email = user[:email]
      params[:network_name] = 'pt'
      params[:user_data] = {}.merge user

      params[:user_data].delete(:id) if params[:user_data] && params[:user_data][:id]
    end

    params[:user_data][:data] = params[:user_data][:data].to_json if params[:user_data] && params[:user_data][:data]

    params[:access_token] = user[:access_token] if user[:access_token]
    params[:signed_request] = user[:signed_request] if user[:signed_request]
    params[:id_token] = user[:id_token] if user[:id_token]

    Dito::Request.post 'login', "/users/#{network_name}/#{social_id}/signup", params
  end
end