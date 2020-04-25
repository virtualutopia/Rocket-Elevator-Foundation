# require "rspec/mocks/standalone"

module ControllerHelpers
   def sign_in(user)
     if user.nil?
       allow(request.env['warden']).to receive(:authenticate!).and_throw(:warden, {:scope => :user})
       allow(controller).to receive(:current_user).and_return(nil)
     else
       allow(request.env['warden']).to receive(:authenticate!).and_return(user)
       allow(controller).to receive(:current_user).and_return(user)
     end
   end
 end


    # json = {"id"=>"5", "email"=>"newuser@mail.com", "firstName"=>"user", "lastName"=>"McUser", "job_title"=>"user", "phoneNumber"=>"1234567", "companyName"=>"UserCo"}.to_json
  # p json
  # current_user = User.new
  # current_user.from_json(json)
  # p current_user.email
  # before do
  #    allow_any_instance_of(Devise::Controllers::Helpers).to receive(:user_signed_in?).and_return(true)
  #    allow_any_instance_of(User).to receive(:is_employee).and_return(true)
  # end

# #### ADMIN log in into the ADMINISTRATION PANEL
#   RSpec.describe "create new user", :type => :feature do 
#     it 'sings up a new user', :focus do 
#        visit 'users/sign_up'
#        fill_in 'user_firstName', with: 'usertest'
#        fill_in 'user_companyName', with: 'Company'
#        fill_in 'user_phoneNumber', with: '123456'
#        fill_in 'user_email', with: 'usertest@hotmail.com'
#        fill_in 'user_password', with: '1qaAQ!'
#        fill_in 'user_password_confirmation', with: '1qaAQ!'
#        click_button "Sign up"
       
#        # Mock The two authentication check: 1- be logged in & 2- be an employee
#        allow_any_instance_of(Devise::Controllers::Helpers).to receive(:user_signed_in?).and_return(true)
#        allow_any_instance_of(User).to receive(:is_employee).and_return(true)
 
#        sleep(2)
#        click_button "PROFILE"
#        sleep(2)
#        click_button "Administration section"
#        sleep(2)
#        expect(page).to have_content "Site Administration"
#        click_button "Leads"
#        sleep(2)
#        expect(page).to have_content "List of Leads"
 
#     end
#  end