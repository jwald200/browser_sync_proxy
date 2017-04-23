module BrowserSyncProxy
  # TODO: help method
  # option to name the setting and print to user which settings are being used
  # refactor CLI
  # refactor OptionsBuilder to return array
  class CLI
    def initialize(args)
      @argument = args.first
      @argument = @argument.gsub('-', '').to_sym if @argument
    end

    def start
      case @argument
      when :setup
        BrowserSyncProxy::Setup.new.run
      else
        options = BrowserSyncProxy::OptionsBuilder.new(@argument)

        if [options.host, options.port, options.directories].any?(&:nil?)
          msg = <<~MSG
                  #{"You don't have a config file setup.".colorize(:red)}

                  Type `browser_sync_proxy setup`
                  or use a default option Like:
                  `browser_sync_proxy --rails` or `browser_sync_proxy --sinatra`
                MSG

          abort msg
        end

        BrowserSyncProxy::Runner.start(options)
      end
    end
  end
end
