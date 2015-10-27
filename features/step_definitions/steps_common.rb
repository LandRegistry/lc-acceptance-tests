
if is_gui?
    Capybara.default_driver = :selenium
else
    Capybara.default_driver = :poltergeist
    Capybara.javascript_driver = :poltergeist
    require 'capybara/poltergeist'
    Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(
            app,
            inspector: true,
            timeout: 240,
            js_errors: false,
            window_size: [1600,1200],
            phantomjs_options: [
                '--ignore-ssl-errors=yes',
                '--local-to-remote-url-access=yes'
            ]
        )
    end
end