require 'rails_helper'

describe ConvertByDialect do
  describe '#process' do
    let(:content) { 'Unrelevant'}
    let(:subject) { ConvertByDialect.new(content, dialect).process }


    context 'for pirrate' do
      let(:dialect) { 'pirate' }
      it 'call request for pirate API' do
        expect_any_instance_of(ConvertByDialect).to receive(:convert_by).with('pirate')
        subject
      end
    end

    context 'for yoda' do
      let(:dialect) { 'yoda' }
      it 'call request for pirate API' do
        expect_any_instance_of(ConvertByDialect).to receive(:convert_by).with('yoda')
        subject
      end
    end

    context 'for valley girl' do
      let(:dialect) { 'valley_girl' }
      it 'call request for pirate API' do
        expect_any_instance_of(ConvertByDialect).to receive(:convert_by).with('valley_girl')
        subject
      end
    end

    context 'unexpected arg' do
      let(:dialect) { 'hodor' }
      it 'raise error about unexpected dialect' do
        expect{subject}.to raise_error(ConvertByDialect::Process::UnexpectedDialect)
      end
    end
  end
end
