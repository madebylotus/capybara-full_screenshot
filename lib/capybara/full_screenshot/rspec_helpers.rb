module Capybara
  module FullScreenshot
    module RSpecHelpers
      def save_and_open_full_screenshot
        width  = Capybara.page.execute_script("return Math.max(document.body.scrollWidth, document.body.offsetWidth, document.documentElement.clientWidth, document.documentElement.scrollWidth, document.documentElement.offsetWidth);")
        height = Capybara.page.execute_script("return Math.max(document.body.scrollHeight, document.body.offsetHeight, document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight);")

        Capybara.current_session.current_window.resize_to(width+100, height+100)

        img = Capybara.page.driver.browser.screenshot_as(:png)

        path = FullScreenshot.screenshot_path
        File.open(path, 'wb+') { |f| f.write(img) }

        Launchy.open("file:///#{ URI.parse(CGI.escape(path.to_s)) }")
      end
    end
  end
end
