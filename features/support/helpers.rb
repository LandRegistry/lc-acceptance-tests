
#####################
#BANKRUPTCY HELPER METHODS
####################

def submit_new_reg
  @today = Date.today.strftime("%d/%m/%Y")
  fill_in('reg_date', :with => @today)
  click_button "continue"
end

def goto_bank_verification_page
  click_button('continue')
  expect(page).to have_css("#generate_K22_yes")
  expect(page).to have_css("#generate_K22_no")
end

def amend_add_debtor
  fill_in('forenames_1', :with => "")
  fill_in('forenames_1', :with => "Pen")
  fill_in('surname_1', :with => "")
  fill_in('surname_1', :with => "Drive")
  find(:id, 'addname').click
  fill_in('forenames_2', :with => "")
  fill_in('forenames_2', :with => "Charles")
  fill_in('surname_2', :with => "")
  fill_in('surname_2', :with => "Taylor")
end

def bank_reg_details()
  fill_in('court', :with => 'Banana County Court')
  fill_in('ref_no', :with => '888')
  click_button('continue')
  fill_in('forenames_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas')
  fill_in('occupation', :with => 'Clergy')
  fill_in('add_1_line1', :with => '55 New Street')
  fill_in('add_1_line2', :with => 'Middlebrook')
  fill_in('add_1_line3', :with => 'Winchester')
  fill_in('add_1_line4', :with => 'Hampshire')
  fill_in('county_1', :with => 'Hants')
  fill_in('postcode_1', :with => 'B34 1AA')
  click_button('continue')
  fill_in('forename_1', :with => 'Pablo')
  fill_in('surname_1', :with => 'Perigas')
  fill_in('court_name', :with => 'Banana County Court')
  click_button('continue')
end

####################
#COMMON METHODS
####################
def navigate_to_homepage
  find(:xpath, ".//*[@id='side-nav']/li[1]/a").click
end

def launch_correction_pge
  find(:xpath, ".//*[@id='content']/div[2]/div[5]/div[4]/div/ul/li/a").click
end

def complete_transaction
  find(:id, "complete").click
end

def click_to_continue
  find(:id, "continue").click
end

def submit_data
  find(:id, "submit").click
end

def enter_particulars_of_dwelling
  fill_in('pri_notice',:with =>'127')
  fill_in('county_0', :with => 'Poole')
  fill_in('District',:with => 'Devon')
  fill_in('short_desc', :with =>'free format2werslkfxdlkf')
end

def reject_application
  find_link('reject').visible?
  click_link 'reject'
  click_button 'cancel-reject'
end

def accept_application
  find_link('reject').visible?
  click_link 'reject'
  click_button 'accept-reject'
end


#####################
#LC HELPER METHODS
####################

def verify_classes
 if @formtype == 'K1'
    select 'LC', from:  "class"
  elsif  @formtype == 'K2'
    select 'F', from:  "class"
  elsif  @formtype == 'K3'
    select 'PA', from:  "class"
  elsif  @formtype == 'K4'
    select 'WO', from:  "class"  
  elsif  @formtype == 'K6'
    select 'LC', from:  "class"
  else
    nil
  end 
  end

def change_estate_owner_to_county_council
  select 'County Council or Greater London or Manchester Council', from: 'estateOwnerTypes'
    fill_in 'loc_auth', :with => 'Leicester County Council'
    fill_in 'loc_auth_area', :with => 'Leicestershire'
end

def select_needK22_yes
  choose "K22_yes"
end

def select_needK22_no
  choose "K22_no"
end

def select_print_centrally
  choose "central"
end

def select_print_locally
  choose "local"
end