describe BrowserSyncProxy::CLI do
  describe '#setup' do
    it 'starts the setup' do
      setup = BrowserSyncProxy::Setup.new
      expect(setup).to receive(:run)
      expect(subject).to receive(:setup)
      subject.setup
    end
  end

  xdescribe '#start' do
    it 'errors if no config found' do

    end

    it 'starts browser-sync with sinatra defaults if --sinatra given' do

    end

    it 'starts browser-sync with rails defaults if --rails given' do

    end
  end
end
