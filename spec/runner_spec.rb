describe BrowserSyncProxy::Runner do
  let(:options) {['localhost', '3000', 'app/views']}

  it "will run the browser-sync cmd with options" do
    cmd = "browser-sync start --proxy #{options[0]}:#{options[1]} --files '#{options[2]}'"

    expect(BrowserSyncProxy::Runner).to receive(:system).with(cmd)
    BrowserSyncProxy::Runner.start *options
  end
end
