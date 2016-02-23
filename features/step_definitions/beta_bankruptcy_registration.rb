Given(/^I am on the bankruptcy registration screen$/) do
  visit( "#{$FRONTEND_URI}/get_list?appn=bank_regn" )
  maximise_browser
end

When(/^I select an application type of PAB with a single image$/) do
  within(:xpath, ".//*[@id='row_1']/td[2]") do
  page.should have_content('PAB')
  @formtype = 'PAB'
  puts(@formtype)
  end
  find(:id, "row_1").click
end

When(/^I enter court name the details are visible$/) do
  fill_in('court', :with => 'County Court of Portsmouth')
end

When(/^I enter court reference the details are visible$/) do
  fill_in('ref_num', :with => '384')
end

When(/^I enter case year the details are visible$/) do
    fill_in('ref_year', :with => '2013')
end

When(/^I can confirm that I am on the debtors details screen$/) do
  expect(page).to have_content('Particulars of debtor')
end


When(/^I enter debtors name the details are visible$/) do
  expect(page).to have_content('Forename')
  expect(page).to have_content('Surname')
  fill_in('forename_1', :with => 'Javon')
  fill_in('Surname_1', :with => 'Ryan')
    
end

When(/^I enter occupation the details are visible$/) do
    fill_in('occupation', :with => 'singer')
end

When(/^i click add AKA new fields are displayed$/) do
  find(:id, 'aka').click
end

When(/^I enter the first AKA the details are visible$/) do
  fill_in('forename_2', :with => 'Barry')
  fill_in('Surname_2', :with => 'Scottie')
end

When(/^I enter the second AKA the details are visible$/) do
  fill_in('forename_3', :with => 'Barrington')
  fill_in('Surname_3', :with => 'Scottie-Dottie')
end

When(/^I enter the address the details are visible$/) do
  fill_in('address_1', :with => '123 New Street')
  fill_in('address_2', :with => 'Middlebrook')
  fill_in('address_3', :with => 'Winchester')
  fill_in('address_4', :with => 'Hampshire')
  fill_in('county', :with => 'Hants')
  fill_in('postcode', :with => 'SO14 1AA')
end

When(/^I click to add additional address new fields are visible$/) do
  expect(page).to have_id('address_2')
end

When(/^can be completed$/) do
  fill_in('address_1', :with => '123 Stoke Newington Church Street')
  fill_in('address_2', :with => 'Middlebrooking')
  fill_in('address_3', :with => 'Chinchester')
  fill_in('address_4', :with => 'Hampshire')
  fill_in('county', :with => 'Hants')
  fill_in('postcode', :with => 'SO14 11AA')
end

When(/^I am on the verification screen I can rekey debtor's name$/) do
  expect(page).to have_content('Forename')
  expect(page).to have_content('Surname')
  fill_in('forename_1', :with => 'Javon')
  fill_in('Surname_1', :with => 'Ryan')
end

When(/^I am on the verification screen I can change debtor's AKA name$/) do
  find(:id, 'change').click
  fill_in('forename_2', :with => 'Javine')
  fill_in('Surname_2', :with => 'Ryan')
end

When(/^I am on the verification screen I can view reference numbers$/) do
  expect(page).to have_content('384 of 2013')
end

When(/^I am on the verification screen I can rekey debtor's AKA name$/) do
  fill_in('forename_2', :with => 'Javine')
  fill_in('Surname_2', :with => 'Ryan')
end

When(/^I am on the verification screen I can rekey court name$/) do
  fill_in('court', :with => 'County Court of Portsmouth')
end

When(/^I am on the Court screen I can enter a valid key number$/) do
  fill_in('key_num', :with =>'1234567')
end