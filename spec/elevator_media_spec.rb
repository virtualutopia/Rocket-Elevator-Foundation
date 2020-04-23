require "ElevatorMedia"
require "test"
# Webmock dependencies
# require 'webmock/rspec'
# WebMock.disable_net_connect!(allow_localhost: true)



 
RSpec.describe Streamer do 

   describe ".APIConnect" do
      context 'GET request verification' do
         it 'In case of failure to connect it retuns response message' do
            expect(Streamer.APIConnect('Nowhere')).to eq('Bad Request')
            # expect{Streamer.APIConnect('Nowhere')}.to raise_error
         end 
         it 'A good request returns API response in Hashed key-value pair (JSON)' do
            expect(Streamer.APIConnect('Iran')).to be_a Hash
            # expect(Streamer.APIConnect('Nowhere')).to be_an_instance_of(String)
            # expect(Streamer.APIConnect('country').response).to eq('OK')
         end
      end
      context 'call the .APIConnect() method using Canada as the input' do
         it "retuns a JSON which it\'s country value is Canada" do                     
            expect(Streamer.APIConnect('Canada')['parameters']['country']).to eq("Canada")
         end 
      end
   end

   describe ".getContent" do
      context 'output type' do 
         it 'returns an HTML' do
            expect(Streamer.getContent()).to be_kind_of String
         end
      end

       
   end
end

  