require 'rails_helper'
# To see test steps in the browser
Capybara.default_driver = :selenium_chrome
# Filling the submission from using Capybara finder/matcher s
RSpec.describe 'Submission form', :type => :feature do
   describe 'fill a new submission form' do
      it 'submits a form' do

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
   
         visit 'submission'
         sleep(1)
         # select residential from dropdown menu
         find('#departmentSelector').find(:xpath, 'option[2]').select_option
         sleep(1)
         fill_in 'apartment', with: '8'
         fill_in 'floor', with: '3'
         fill_in 'basement', with: '1'
         sleep(1)
         # will choose a descendant radio button with a name, id, or label text matching 's' which is Standard cages
         choose('s')
         sleep(3)
         click_button('Send the quote')
         sleep(5)
      end
   end
end