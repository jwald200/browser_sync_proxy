module Questionable
  attr_reader :user_input

  def ask(question:, validate: nil, error_message: nil)
    say question
    get_input

    if validate
      loop do
        break if user_input.match(validate)

        say error_message
        get_input
      end
    end

    user_input
  end

  def say(message, color = nil)
    message = message.colorize(color) if color
    message.end_with?(' ') ? print(message) : puts(message)
  end

  def get_input
    @user_input = $stdin.gets.chomp
  end
end
