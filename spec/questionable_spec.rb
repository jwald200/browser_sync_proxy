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
    it 'outputs to stdout the question' do
      msg = "What's your name?"

      output = capture_output { subject.ask question: msg }
      expect(output.first).to eq(msg)
    end

    context 'with valitation' do
      let(:input) { ['some text', 'hello'] }
      let(:output_1) do
        capture_output(input) do
          subject.ask(question: "What's your name?", validate: /\Ahello\Z/)
        end
      end

      it 'outputs standart error message when custom error not given' do
        expect(output_1.last).to eq("must match /\\Ahello\\Z/")
      end

      let(:error_message) { 'You must enter hello' }
      let(:output_2) do
        capture_output(input) do
          subject.ask(
            question: "What's your name?",
            validate: /\Ahello\Z/,
            error_message: error_message
          )
        end
      end

      it 'outputs custom error message' do
        expect(output_2.last).to eq error_message
      end
    end
  end
end
