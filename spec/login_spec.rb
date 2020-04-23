require 'rails_helper'

RSpec.describe 'login pannel' do 
   context 'try login' do
      it 'opnes homepage after login' do
         visit 'users/sign_in'
      end
   end
end
