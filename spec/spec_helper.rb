require_relative "../config/environment"

def delete_file(file_name)
  File.delete(file_name) if File.exist? file_name
end

def capture_output(*input)
  $stdout = StringIO.new
  $stdin = StringIO.new input.flatten.join("\n")

  yield
  $stdout.string.split("\n")
ensure
  $stdout, $stdin = STDOUT, STDIN
end
