require_relative "../config/environment"

def delete_file(file_name)
  File.delete(file_name) if File.exist? file_name
end

module FakeIO
  def self.captured_output
    $stdout.string.split("\n")
  end

  def self.set_user_input(*input)
    $stdin = StringIO.new(input.join("\n"))
  end

  def self.user_input
    $stdin.string.split("\n")
  end
end
