module Questionable
  attr_reader :user_input

  def ask(question:, validate: nil, error_message: nil)
    say question
    get_input

    if validate
      loop do
        break if user_input.match(validate)

        say(error_message || "must match /#{validate.source}/")
        get_input
      end
    end

    user_input
  end

  def say(message, color = nil)
    message = message.colorize(color) if color
    message.end_with?(' ') ? $stdout.print(message) : $stdout.puts(message)
  end

  private

  def get_input
    @user_input = $stdin.gets&.chomp
  end
end

include Questionable
