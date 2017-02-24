require 'spec_helper'

describe Dito::Domain do
  let(:url) { Dito::Domain.new('notification').url }
  let(:api_key) { rand(9_999_999_999) }
  let(:secret) { rand(9_999_999_999) }

  before(:each) do
    Dito.configure do |config|
      config.api_key = api_key
      config.secret = secret
    end
  end

  context 'when is on production environment' do
    before(:each) do
      Dito::Config.environment = 'production'
    end

    describe '.url' do
      it 'should mount the correct url' do
        expect(url).to eq('https://notification.plataformasocial.com.br')
      end
    end
  end

  context 'when is on development environment' do
    before(:each) do
      Dito::Config.environment = 'development'
    end

    describe '.url' do
      it 'should mount the correct url' do
        expect(url).to eq('https://notification.dev.plataformasocial.com.br')
      end
    end
  end
end
