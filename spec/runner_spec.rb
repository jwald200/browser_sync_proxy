describe BrowserSyncProxy::Runner do
  let(:options) do
    double(
      'OptionsBuilder',
      host: 'localhost',
      port: '3000',
      directories: 'app/views'
    )
  end

  it "will run the browser-sync cmd with options" do
    cmd = "browser-sync start --proxy #{options.host}:#{options.port} --files '#{options.directories}'"

    expect(BrowserSyncProxy::Runner).to receive(:system).with(cmd)
    BrowserSyncProxy::Runner.start options
  end
end
