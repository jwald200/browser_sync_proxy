module BrowserSyncProxy
  class CLI
    def initialize(args)
      @argument = args.first
      @argument = @argument.gsub('-', '').to_sym if @argument
    end

    def start
      case @argument
      when :setup
        BrowserSyncProxy::Setup.start
      else
        options = BrowserSyncProxy::OptionsBuilder.new(@argument)

        if [options.host, options.port, options.files].any?(&:nil?)
          puts 'we werent able to get the options pls use 1 of the...'
        else
          BrowserSyncProxy::Runner.start(options)
        end
      end
    end
  end
end
