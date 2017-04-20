$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "browser_sync_proxy"

def delete_file(file_name)
  File.delete(file_name) if File.exist? file_name
end
