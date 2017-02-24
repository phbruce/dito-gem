require 'spec_helper'

describe Dito do
  let(:api_key) { rand(9_999_999_999) }
  let(:secret) { rand(9_999_999_999) }

  before(:each) do
    Dito.configure do |config|
      config.api_key = api_key
      config.secret = secret
    end
  end

  describe '.configure' do
    it 'yields config' do
      Dito.configure { |config| expect(config).to be_a(Dito::Config) }
    end

    it 'sets values config' do
      expect(Dito::Config.api_key).to eq(api_key)
    end

    it 'default environment should be production' do
      expect(Dito::Config.environment).to eq('production')
    end
  end
end
