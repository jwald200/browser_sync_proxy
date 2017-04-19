require 'spec_helper'

describe BrowserSyncProxy::OptionsBuilder do
  describe 'default option given' do
    it 'sets to sinatra defaults when initialize with :sinatra' do
      options = BrowserSyncProxy::OptionsBuilder.new :sinatra

      expect(options.host).to eq 'localhost'
      expect(options.port).to eq '9292'
      expect(options.files).to eq 'views/*'
    end

    it 'sets to rails defaults when initialize with :rails' do
      options = BrowserSyncProxy::OptionsBuilder.new :rails

      expect(options.host).to eq 'localhost'
      expect(options.port).to eq '3000'
      expect(options.files).to eq 'app/assets, app/views'
    end
  end

  describe 'no default_option given' do
    it 'sets values to user config file' do
    end
  end

  describe 'no default option and no config file' do

  end
end
