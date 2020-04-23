require 'rails_helper'
require 'devise'

RSpec.describe 'login pannel', :type => :feature do 
   context 'signup' do 
      it 'sings up a new user' do 
         visit 'users/sign_in'
         click_button "Sign up"
         fill_in 'user_firstName', with: 'usertest'
         fill_in 'user_phoneNumber', with: '123456'
         fill_in 'user_email', with: 'usertest@hotmail.com'
         fill_in 'user_password', with: '1qaAQ!'
         fill_in 'user_password_confirmation', with: '1qaAQ!'
         click_button "Sign up"
         click_button "PROFILE"
         click_button "Edit profile"
         expect(page).to have_content "Edit User"



      end
   end
   context 'mock admin' do
      it 'entres the administration panel then into the Leads section', :focus do
         @request.env["devise.mapping"] = Devise.mappings[:admin]
         sign_in FactoryBot.create(:admin)
         # expect(:current_user.email).to eq('user@hotmail.com')
         click_button "PROFILE"
         click_button "Administration section"
         expect(page).to have_content "Site Administration"
         click_button "Leads"
         expect(page).to have_content "List of Leads"
      end

   end
end
