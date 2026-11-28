require "test_helper"

# Workaround for https://github.com/teamcapybara/capybara/issues/2865
if Gem.loaded_specs.fetch("capybara").version == Gem::Version.new("3.40.0")
  require "capybara/selenium/driver"

  Capybara::Selenium::Driver::ChromeDriver.prepend(Module.new do
    def reset!
      return unless @browser
      return super if chromedriver_version < 158

      standard_reset = Capybara::Selenium::Driver.instance_method(:reset!)
      switch_to_window(window_handles.first)
      window_handles.drop(1).each do |handle|
        within_given_window(handle) { standard_reset.bind_call(self) }
        close_window(handle)
      end
      standard_reset.bind_call(self)
    end
  end)
end

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  if ENV["CAPYBARA_SERVER_PORT"]
    served_by host: "rails-app", port: ENV["CAPYBARA_SERVER_PORT"]

    driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ], options: {
      browser: :remote,
      url: "http://#{ENV["SELENIUM_HOST"]}:4444"
    }
  else
    driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
  end
end
