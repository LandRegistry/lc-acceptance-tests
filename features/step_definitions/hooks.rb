Before do |scenario|
    prepare_data
end

After do |scenario|
    # Cucumber.wants_to_quit = true if scenario.failed?
end