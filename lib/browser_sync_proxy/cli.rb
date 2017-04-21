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
          puts 'You don\'t have a config file in the root of your project'
          puts ''

        else
          BrowserSyncProxy::Runner.start(options)
        end
      end
    end
  end
end
