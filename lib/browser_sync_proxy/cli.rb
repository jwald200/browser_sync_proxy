module BrowserSyncProxy
  class CLI
    def initialize(args)
      @argument = args.first
      @argument = @argument.gsub('-', '').to_sym if @argument
    end

    def start
      case @argument
      when :setup
        BrowserSyncProxy::Setup.run
      else
        options = BrowserSyncProxy::OptionsBuilder.new(@argument)

        if [options.host, options.port, options.files].any?(&:nil?)
          msg = <<~MSG
                  #{"You don't have config file setup.".colorize(:red)}

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
