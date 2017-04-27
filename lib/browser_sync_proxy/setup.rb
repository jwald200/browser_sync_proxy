module BrowserSyncProxy
  class Setup
    attr_reader :config

    def run
      loop do
        gather_config_from_user
        print_config

        answer = ask(question: 'Sould we save it? (y/n) or quit to exit').downcase

        return if answer == 'quit'
        break if ['y', 'yes'].include? answer
      end

      save_to_file
    end

    def gather_config_from_user
      @config = {}
      @config[:host] = host_prompt
      @config[:port] = port_prompt
      @config[:directories] = directories_prompt
    end

    def host_prompt
      ask(
        question: 'Please enter your host name. For example, localhost:',
        validate: /.+/,
        error_message: "host can't be empty."
      )
    end

    def port_prompt
      ask(
        question: 'Please enter the port number:',
        validate: /\A\d{4,}\Z/,
        error_message: "Please enter a valid port number."
      )
    end

    def directories_prompt
      ask(
        question: "Directories to track  (comma sep list):",
        validate: /.+/,
        error_message: 'Directories can\'t be empty.'
      ).gsub(/'|"/, '').split(/,\s*/)
    end

    def print_config
      say 'Here is what we have:'

      config.each do |key, value|
        value = value.join(', ') if key == :directories
        say "#{key}: #{value.colorize(:green)}"
      end
    end

    def save_to_file
      File.write('browser_sync_proxy.yml', config.to_yaml)
      say 'Your configurations where saved to browser_sync_proxy.yml', :green
    end
  end
end
