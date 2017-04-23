require 'psych'

module BrowserSyncProxy
  class OptionsBuilder
    def initialize(default_option = nil)
      @default_option = default_option
    end

    def values
      [options[:host], options[:port], options[:directories]&.join(', ')]
    end

    private

    def config_file_path
      if %i(sinatra rails).include? @default_option
        File.join(File.dirname(__FILE__), "../../config/#{@default_option}_config.yml")
      else
        'browser_sync_proxy.yml'
      end
    end

    def options
      @options ||= File.exist?(config_file_path) ? Psych.load_file(config_file_path) : {}
    end
  end
end
