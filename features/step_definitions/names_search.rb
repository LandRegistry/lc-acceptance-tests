Given(/^a populated name database$/) do
    sleep(1)
end

names_api = nil
When(/^I search the name database for '([^']+)'$/) do |name|
    names_api = RestAPI.new($NAMES_SEARCH_URI)
    names = name.split(' ')
    surname = names.last
    forenames = names[0..-2].join('%20')
    names_api.get("/search?forename=#{forenames}&surname=#{surname}")
end

Then(/^the search result will contain '([^']+)'$/) do |name|
    result = names_api.data
    found = false
    result.each do |hit|
        if hit['full_name'].casecmp(name) == 0
            found = true
            break
        end
    end

    expect(found).to be true
end

Then(/^the search result will not contain '([^']+)'$/) do |name|
    result = names_api.data
    found = false
    result.each do |hit|
        if hit['full_name'].casecmp(name) == 0
            found = true
            break
        end
    end

    expect(found).to be false
end