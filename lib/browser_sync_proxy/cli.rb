module BrowserSyncProxy
  # TODO: help method
  # option to name the setting and print to user which settings are being used
  class CLI < Thor
    default_task :start

    desc "setup", "setup a new config file"
    def setup
      Setup.new.run
    end

    option :rails, type: :boolean
    option :sinatra, type: :boolean
    desc "start DEFAULT_OPTION", 'start browser-sync. You can also provide --rails or --sinatra'
    def start
      options_builder = OptionsBuilder.new(options.keys.first&.to_sym)

      if options_builder.values.any?(&:nil?)
        abort <<~MSG
                #{"You don't have a config file setup.".colorize(:red)}

                Type `browser_sync_proxy setup`
                or use a default option Like:
                `browser_sync_proxy --rails` or `browser_sync_proxy --sinatra`
              MSG
      end

      Runner.start(*options_builder.values)
    end

    desc "version", "Prints the browser_sync_proxy's version information"
    def version
      say "Browser_sync_proxy version #{VERSION}"
    end
    map %w(-v --version) => :version
  end
end
