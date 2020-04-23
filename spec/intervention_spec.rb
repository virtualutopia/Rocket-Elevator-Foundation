require 'rails_helper'

RSpec.describe 'intervention page', :type => :feature do
   context 'checking cascade dropdown menus' do 
      it 'changes the next menu content' do 
         visit 'users/sign_in'
         fill_in 'user_email', with: 'admin@hotmail.com'
         fill_in 'user_password', with: '111111'
         click_button "Log in"
         # visit 'index'
         # expect(page).to have_content "Residential services"
         click_button "SESSION"
         click_button "Log in"
         expect(page).to have_content "Didn't receive unlock instructions?"
         # visit 'index'
         
         # expect(page).to have_content "Residential services" #"New Intervention" #"This page is reserved to the Employees"
         # visit 'interventions'
         # expect(page).to have_content "New Intervention" 
      end
   end

end