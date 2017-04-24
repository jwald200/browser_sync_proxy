describe BrowserSyncProxy::CLI do
  describe '#setup' do
    it 'starts the setup' do
      input = ['localhost', '3333', 'files', 'quit']
      output = capture_output(input) { subject.setup }

      expect(output.first).to include('Please enter your host')
    end
  end

  describe '#start' do
    context 'no config found' do
      it 'exit with error' do
        expect { capture_stderr {subject.start} }.to raise_error(SystemExit)
      end
    end

    context 'sinatra option given' do
      let(:cmd) {"browser-sync start --proxy localhost:9292 --files 'views/*'"}
      it 'starts browser-sync with sinatra defaults' do
        expect(BrowserSyncProxy::Runner).to receive(:system).with(cmd)

        subject.options = {'sinatra' => true}
        subject.start
      end
    end

    context 'rails option given' do
      let(:cmd) {"browser-sync start --proxy localhost:3000 --files 'app/assets, app/views'"}
      it 'starts browser-sync with rails defaults' do
        expect(BrowserSyncProxy::Runner).to receive(:system).with(cmd)

        subject.options = {'rails' => true}
        subject.start
      end
    end

  end
end
