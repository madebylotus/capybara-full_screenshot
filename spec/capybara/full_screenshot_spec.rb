require "spec_helper"

RSpec.describe Capybara::FullScreenshot do
  it "has a version number" do
    expect(Capybara::FullScreenshot::VERSION).not_to be nil
  end

  describe '.storage_directory' do
    context 'when Rails is present' do
      before do
        stub_const("Rails", Class.new)
        allow(Rails).to receive_message_chain(:root, :join).with('tmp', 'capybara').and_return('capybara')
      end

      it 'returns the result of using Rails root path' do
        expect(subject.storage_directory).to eq('capybara')
      end
    end

    context 'without Rails' do
      it 'returns absolute current path' do
        expect(subject.storage_directory).to eq(File.expand_path('./'))
      end
    end
  end

  describe '.screenshot_path' do
    before do
      allow(subject).to receive(:unique_filename).and_return('filename.png')
    end

    it 'returns a String' do
      expect(subject.screenshot_path).to be_a(String)
    end

    it 'returns an absolute path' do
      expect(subject.screenshot_path).to eq(File.expand_path('./filename.png'))
    end
  end

  describe '.unique_filename' do
    before do
      allow(Time).to receive_message_chain(:now, :to_i).and_return(100)
    end

    it 'uses the current timestamp in filename' do
      expect(subject.unique_filename).to eq('full-page-screenshot-100.png')
    end
  end
end
