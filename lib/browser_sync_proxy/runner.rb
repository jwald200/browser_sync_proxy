module BrowserSyncProxy
  class Runner
    def self.start(host, port, directories)
      system "browser-sync start --proxy #{host}:#{port} --files '#{directories}'"
    end
  end
end
