require 'spec_helper'

describe BrowserSyncProxy::Runner do
  it "will run the browser-sync cmd with options" do
    options = BrowserSyncProxy::OptionsBuilder.new :sinatra
    runner = BrowserSyncProxy::Runner
    cmd = "browser-sync start --proxy #{options.host}:#{options.port} --files '#{options.files}'"
    
    expect(runner).to receive(:system).with(cmd)
    runner.start options
  end
end
