module Dito
  def self.track options = {}
    options.symbolize_keys!

    if options[:reference]
      id = options[:reference]
      id_type = nil
    elsif options[:facebook_id] || options[:fb_id]
      id = options[:facebook_id] || options[:fb_id]
      id_type = 'facebook_id'
    elsif options[:google_plus_id] or options[:plus_id]
      id = options[:google_plus_id] || options[:plus_id]
      id_type = 'google_plus_id'
    elsif options[:twitter_id]
      id = options[:twitter_id]
      id_type = 'twitter_id'
    else #portal
      id = options[:id]
      id_type = 'portal'
    end

    params = event: options[:event].to_json
    params[:id_type] = id_type if id_type.present?

    Dito::Request.post 'events', "/users/#{id}/", params
  end
end