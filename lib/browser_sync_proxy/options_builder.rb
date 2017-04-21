require 'psych'

module BrowserSyncProxy
  class OptionsBuilder
    attr_reader :host, :port, :directories

    def initialize(default_option = nil)
      set_config_file(default_option)
      return unless File.exist? @config_file
      options = Psych.load_file @config_file

      @host = options[:host]
      @port = options[:port]
      @directories = options[:directories].join(', ')
    end

    private

    def set_config_file(default_option)
      if %i(sinatra rails).include? default_option
        @config_file = File.join(File.dirname(__FILE__), "../../config/#{default_option}_config.yml")
      else
        @config_file = 'browser_sync_proxy.yml'
      end
    end
  end
end
