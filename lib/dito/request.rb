require 'rsa'
require 'openssl'
require 'faraday'
require 'faraday_middleware'

module Dito
  class Request

    def self.post module_name, path, params = {}, headers = {}
      make_request module_name, path, params, headers, 'post'
    end

    def self.get module_name, path, params = {}, headers = {}
      make_request module_name, path, params, headers, 'get'
    end

    def self.put module_name, path, params = {}, headers = {}
      make_request module_name, path, params, headers, 'put'
    end

    def self.delete module_name, path, params = {}, headers = {}
      make_request module_name, path, params, headers, 'delete'
    end

    def self.make_request module_name, path, params = {}, headers = {}, method = "get"
      conn = Faraday.new(:url => Dito.domains(module_name)) do |faraday|
        faraday.request  :url_encoded             # form-encode POST params
        faraday.response :json, :content_type => 'application/json'
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      end

      signature = OpenSSL::PKey::RSA.new(File.read("#{Dito.root}/dito.pem")).public_encrypt Dito.secret

      params = {
        :network_name => "fb",
        :platform_api_key => Dito.api_key,
        :signature => signature
      }.merge(params)

      response = conn.send method, path, params, headers
      response.body
    end
  end
end