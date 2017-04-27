module BrowserSyncProxy
  class CLI < Thor
    default_task :start

    desc "setup", "sets up a new config file"
    def setup
      Setup.new.run
    end

    option :rails, type: :boolean
    option :sinatra, type: :boolean
    desc "start [OPTIONS]", 'starts browser-sync. You can also provide --rails or --sinatra'
    def start
      options_builder = OptionsBuilder.new(options.keys.first&.to_sym)

      if options_builder.values.any?(&:nil?)
        abort <<~MSG
                #{"You don't have a config file setup.".colorize(:red)}

                Type `bsync setup`
                or use a default option Like:
                `bsync --rails` or `bsync --sinatra`
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
