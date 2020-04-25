require 'rails_helper'
require 'devise'
require 'support/controller_helpers'

RSpec.describe 'login pannel', :type => :feature do 
   context 'signup' do 
      it 'sings up a new user' do 
         visit 'users/sign_up'
         fill_in 'user_firstName', with: 'usertest'
         fill_in 'user_companyName', with: 'Company'
         fill_in 'user_phoneNumber', with: '123456'
         fill_in 'user_email', with: 'usertest@hotmail.com'
         fill_in 'user_password', with: '1qaAQ!'
         fill_in 'user_password_confirmation', with: '1qaAQ!'
         click_button "Sign up"
         
         visit 'users/edit'
         expect(page).to have_content "leave blank if you don't want to change it"
      end
   end
end



 