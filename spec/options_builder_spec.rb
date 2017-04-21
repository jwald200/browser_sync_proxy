describe BrowserSyncProxy::OptionsBuilder do
  context ':sinatra option given' do
    it 'sets to sinatra defaults' do
      options = BrowserSyncProxy::OptionsBuilder.new :sinatra

      expect(options.host).to eq 'localhost'
      expect(options.port).to eq '9292'
      expect(options.directories).to eq 'views/*'
    end
  end

  context ':rails option given' do
    it 'sets to rails defaults' do
      options = BrowserSyncProxy::OptionsBuilder.new :rails

      expect(options.host).to eq 'localhost'
      expect(options.port).to eq '3000'
      expect(options.directories).to eq 'app/assets, app/views'
    end
  end

  context 'no default option given' do
    let(:options) { BrowserSyncProxy::OptionsBuilder.new }
    let(:user_config_file) { "browser_sync_proxy.yml" }

    around(:example) do |example|
      delete_file user_config_file
      example.run
      delete_file user_config_file
    end

    it 'sets values to user config file if config file present' do
      settings = {host: 'localhost', port: '4000', directories: ['views']}.to_yaml
      File.write(user_config_file, settings)

      expect(options.host).to eq('localhost')
      expect(options.port).to eq('4000')
      expect(options.directories).to eq('views')
    end

    it 'values remain nil when no user-config and no default option given' do
      expect([options.host, options.port, options.directories]).to all be nil
    end
  end
end
