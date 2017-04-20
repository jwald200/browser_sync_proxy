require_relative "../config/environment"

def delete_file(file_name)
  File.delete(file_name) if File.exist? file_name
end
