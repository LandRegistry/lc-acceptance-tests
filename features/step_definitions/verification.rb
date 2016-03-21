Given(/^a '([^']+)' registration in progress for private individual '([^']+)'$/) do |coc, name|
    visit( "#{$FRONTEND_URI}/login" )
    fill_in('username', :with => $LOGIN_USERID)
    fill_in('password', :with => $LOGIN_PASSWORD)
    find(:xpath, "//*[@id='login_button']").click
    
    visit("#{$FRONTEND_URI}/get_list?appn=lc_regn")
    find(:id, "row_1").click

    case coc
        when 'C1'
            select 'C1', from: "class"
    end 
    fill_in('county_0', :with => "Portsmouth")
    fill_in('district', :with => "Nine")
    fill_in('short_desc', :with => "Short Description")

    select 'Private individual', from: 'estateOwnerTypes'
    names = name.split(' ')
    surname = names[-1]
    forename = names[0..-2].join(' ')

    fill_in('forename', :with => forename)
    fill_in('surname', :with => surname)
    find(:id,'continue').click
end

When(/^I get to the verification screen$/) do
  expect(page).to have_content('Re-key estate owner details')
end

When(/^I enter the forename '([^']+)'$/) do |name|
  fill_in('forename', :with => name)
end

When(/^I enter the surname '([^']+)'$/) do |name|
  fill_in('surname', :with => name)
end

When(/^I enter the class '([^']+)'$/) do |coc|
  select coc, from: "class"
end

When(/^I click continue$/) do
  find(:id,'continue').click
end

Then(/^I will be informed that the (.+) (?:are|is) wrong$/) do |thing|
  if thing == 'names'
    expect(page).to have_content('The names do not match the previously entered names.')
  elsif thing == 'class of charge'
    expect(page).to have_content('The class of charge does not match the previously entered class of charge.')
  else
    scenario.fail!(StandardError.new("what is #{thing}?"))    
  end
end
