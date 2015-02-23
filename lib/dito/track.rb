module Dito
  def self.track options = {}
    Dito.symbolize_keys!(options)

    if options[:reference].present?
      id = options[:reference]
      id_type = nil
    elsif options[:facebook_id].present?
      id = options[:facebook_id]
      id_type = 'facebook_id'
    elsif options[:google_plus_id].present?
      id = options[:google_plus_id]
      id_type = 'google_plus_id'
    elsif options[:twitter_id].present?
      id = options[:twitter_id]
      id_type = 'twitter_id'
    elsif options[:id].present?
      id = options[:id]
      id_type = 'id'
    else
      return { error: { message: 'Missing the user id param. See the available options here: http://developers.dito.com.br/docs/sdks/ruby' } }
    end

    params = { event: options[:event].to_json }
    params[:id_type] = id_type if id_type.present?

    Dito::Request.post 'events', "/users/#{id}/", params
  end
end