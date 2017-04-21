module BrowserSyncProxy
  class Runner
    def self.start(options)
      system "browser-sync start --proxy #{options.host}:#{options.port} --files '#{options.directories}'"
    end
  end
end
