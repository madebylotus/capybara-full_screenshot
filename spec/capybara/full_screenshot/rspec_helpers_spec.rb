require "spec_helper"

class HelperContext
  include Capybara::FullScreenshot::RSpecHelpers
end

RSpec.describe Capybara::FullScreenshot::RSpecHelpers do
  describe '.save_and_open_full_screenshot' do
    let(:width)   { 2000 }
    let(:height)  { 2000 }
    let(:path)    { File.expand_path('./tmp/screenshot.png') }

    subject { HelperContext.new }

    before do
      allow(Capybara).to receive_message_chain(:page, :execute_script).and_return(2000)
      allow(Capybara).to receive_message_chain(:page, :driver, :browser, :screenshot_as).with(:png).and_return('image binary')
      allow(Capybara::FullScreenshot).to receive(:screenshot_path).and_return(path)
    end

    it 'resizes the window' do
      expect(Capybara).to receive_message_chain(:current_session, :current_window, :resize_to).with(2100, 2100)
      allow(Launchy).to receive(:open)

      subject.save_and_open_full_screenshot
    end

    it 'saves the file' do
      allow(Capybara).to receive_message_chain(:current_session, :current_window, :resize_to)
      allow(Launchy).to receive(:open)

      subject.save_and_open_full_screenshot

      expect(File).to exist('./tmp/screenshot.png')
    end

    it 'launches the file' do
      allow(Capybara).to receive_message_chain(:current_session, :current_window, :resize_to)

      expect(Launchy).to receive(:open).with("file:///#{ URI.parse(CGI.escape(path)) }")

      subject.save_and_open_full_screenshot
    end
  end
end
