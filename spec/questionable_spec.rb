describe Questionable do
  describe '#say' do
    it 'outputs to stdout' do
      expect{ subject.say('hello') }.to output.to_stdout
    end

    it 'calls #puts when message has no tralling spaces' do
      expect(STDOUT).to receive(:puts)
      subject.say('hello')
    end

    it 'calls #print when message has tralling spaces' do
      expect(STDOUT).to receive(:print)
      subject.say('hello ')
    end
  end

  describe '#ask' do
    before(:example) do |example|
      $stdout = StringIO.new
      $stdin = StringIO.new(' ')
    end

    after(:example) do
      $stdin = STDIN
      $stdout = STDOUT
    end

    it 'outputs to stdout the question' do
      msg = "What's your name?"

      subject.ask question: msg
      expect(FakeIO.captured_output.first).to eq(msg)
    end

    context 'with valitation' do
      before(:example) { FakeIO.set_user_input "go home", "hello" }

      it 'outputs standart error message when custom error not given' do
        subject.ask(question: "What's your name?", validate: /\Ahello\Z/)

        expect(FakeIO.captured_output.last).to eq("must match /\\Ahello\\Z/")
      end

      it 'outputs custom error message' do
        error_message = 'You must enter hello'

        subject.ask(
          question: "What's your name?",
          validate: /\Ahello\Z/,
          error_message: error_message
        )

        expect(FakeIO.captured_output.last).to eq error_message
      end
    end
  end
end
