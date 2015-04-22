# -*- encoding : utf-8 -*-

require 'active_support/core_ext/hash'

module Dito
  def self.generate_credentials(options)
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
      id = nil
      id_type = nil
    end

    return id, id_type
  end
end 