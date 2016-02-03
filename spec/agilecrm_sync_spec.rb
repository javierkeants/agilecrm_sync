require 'spec_helper'

describe AgilecrmSync do
  it 'has a version number' do
    expect(AgilecrmSync::VERSION).not_to be nil
  end

  let(:domain) { 'mydomain' }
  let(:api_key) { 'xxx' }
  let(:email) { 'email@example.com' }

  describe 'configuration' do
    before(:each) do
      AgilecrmSync.configure do |config|
        config.domain = domain
        config.api_key = api_key
        config.email = email
      end
    end

    describe 'configure' do
      it 'has a custom configuration' do
        expect(AgilecrmSync.config.domain).to match domain
        expect(AgilecrmSync.config.api_key).to match api_key
        expect(AgilecrmSync.config.email).to match email
      end

      it 'has a correct endpoint' do
      	expect(AgilecrmSync.endpoint).to eq 'https://mydomain.agilecrm.com/dev/api' 
      end
    end
  end
end
