# Capybara::FullScreenshot
Allows you to capture the entire page, not just the visible portion, when running JS integration tests with Capybara.

This gem will query the browser window contents and resize the window chrome, ensuring that when the screenshot is taken, the window is large enough to show all contents without scroll bars.

## Installation

Add this line to your application's Gemfile:

```ruby
group :test do
  gem 'capybara-full_screenshot'
end
```

And then execute:

    $ bundle

## Usage

To debug, use in any feature test by calling the provided rspec helper method.

```ruby
RSPec.describe 'My Feature', type: :feature do
  before { login && visit(root_path) }

  it 'does something' do
    save_and_open_full_screenshot
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/capybara-full_screenshot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
