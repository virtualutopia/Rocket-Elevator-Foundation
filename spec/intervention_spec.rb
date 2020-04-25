require 'rails_helper'
require 'spec_helper'
# To see test steps in the browser
Capybara.default_driver = :selenium_chrome

RSpec.describe 'intervention page', :type => :feature do
   context 'checking cascade dropdown menus' do 

      it 'changes the next menu content' do 
         
         # Sign-up a new user
         visit 'users/sign_up'
         sleep(1)
         fill_in 'user_firstName', with: 'usertest'
         fill_in 'user_companyName', with: 'Company'
         fill_in 'user_phoneNumber', with: '123456'
         fill_in 'user_email', with: 'usertest@hotmail.com'
         fill_in 'user_password', with: '1qaAQ!'
         fill_in 'user_password_confirmation', with: '1qaAQ!'
         sleep(2)
         click_button "Sign up"

         # Mock The two authentication check: 1- be logged in & 2- be an employee
         # allow_any_instance_of(Devise::Controllers::Helpers).to receive(:user_signed_in?).and_return(true)
         allow_any_instance_of(User).to receive(:is_employee).and_return(true)
         
         visit 'interventions'
         click_on('intervnetion')
         sleep(2)
         fill_in 'intervention_report', with: 'Test Message.'
         sleep(5)
         click_on('commit')
         sleep(5)

         expect(page).to have_content "New Intervention" 
      end
   end
end