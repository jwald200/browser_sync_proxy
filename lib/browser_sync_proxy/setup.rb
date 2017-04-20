module BrowserSyncProxy
  class Setup
    attr_reader :config

    def run
      loop do
        gather_config_from_user
        print_config

        break if yes?('Sould we save it? (y/n) Type n to start over.')
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
        question: 'Please enter your host name. For example, localhost ',
        validate: /.+/,
        error_message: "host can't be empty."
      )
    end

    def port_prompt
      ask(
        question: 'Please enter the port number ',
        validate: /\A\d{4,}\Z/,
        error_message: "Please enter a valid port number."
      )
    end

    def directories_prompt
      ask(
        question: "Directories to track  (comma sep list)  ",
        validate: /.+/,
        error_message: 'Directories can\'t be empty.'
      ).split(/,\s*/)
    end

    def print_config
      puts 'Here is what we have:'

      config.each do |key, value|
        puts "#{key}: #{value}"
      end
    end

    def save_to_file
      File.write('browser_sync_proxy.yml', config.to_yaml)
      puts Rainbow('Your configurations where saved to browser_sync_proxy.yml').color :green
    end

    def ask(question:, validate: nil, error_message: nil)
      question.end_with?(' ') ? print(question) : puts(question)
      answer = gets.chomp

      if validate.class == Regexp
        loop do
          break if answer.match(validate)

          puts error_message
          answer = gets.chomp
        end
      end

      answer
    end

    def yes?(question)
      answer = ask(question: question)
      ['y', 'yes'].include? answer.downcase
    end
  end
end
