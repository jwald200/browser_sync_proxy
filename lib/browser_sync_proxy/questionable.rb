module Questionable
  def ask(question:, validate: nil, error_message: nil)
    question.end_with?(' ') ? print(question) : puts(question)
    answer = $stdin.gets.chomp

    if validate.class == Regexp
      loop do
        break if answer.match(validate)

        puts error_message
        answer = $stdin.gets.chomp
      end
    end

    answer
  end
end
