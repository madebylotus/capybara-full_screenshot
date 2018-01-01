require "capybara"
require "launchy"

require "capybara/full_screenshot/version"
require "capybara/full_screenshot/rspec_helpers"

module Capybara
  module FullScreenshot
    module_function

    def storage_directory
      return Rails.root.join('tmp', 'capybara') if defined?(Rails)

      File.expand_path('./')
    end

    def screenshot_path
      File.join(storage_directory, unique_filename)
    end

    def unique_filename
      "full-page-screenshot-#{ Time.now.to_i }.png"
    end
  end
end

if defined?(RSpec)
  RSpec.configure do |config|
    config.include Capybara::FullScreenshot::RSpecHelpers, type: :feature
  end
end
