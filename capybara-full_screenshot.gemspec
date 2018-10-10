# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capybara/full_screenshot/version'

Gem::Specification.new do |spec|
  spec.name          = "capybara-full_screenshot"
  spec.version       = Capybara::FullScreenshot::VERSION
  spec.authors       = ["Matt Millsaps-Brewer"]
  spec.email         = ["matt@madebylotus.com"]

  spec.summary       = %q{Easily capture the entire page as screenshot in JS capybara tests.}
  spec.description   = %q{Allows you to capture the entire page by resizing the browser window in JS tests.}
  spec.homepage      = "http://www.madebylotus.com"
  spec.license       = "MIT"
  spec.metadata = {
    "source_code_uri" => "https://github.com/madebylotus/capybara-full_screenshot"
  }

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.7"

  spec.add_dependency "capybara", "> 2"
  spec.add_dependency "launchy", ">= 2.1"
end
