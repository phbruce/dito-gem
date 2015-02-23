# -*- encoding : utf-8 -*-

require 'active_support/core_ext/hash'

module Dito
  def self.symbolize_keys!(thing)
    case thing
    when Array
      thing.each{|v| symbolize_keys!(v)}
    when Hash
      thing.symbolize_keys!
      thing.values.each{|v| symbolize_keys!(v)}
    end
    thing
  end
   
  def self.symbolize_keys(thing)
    case thing
    when Array
      thing.map{|v| symbolize_keys(v)}
    when Hash
      inj = thing.inject({}) {|h, (k,v)| h[k] = symbolize_keys(v); h}
      inj.symbolize_keys
    else
      thing
    end
  end
end 