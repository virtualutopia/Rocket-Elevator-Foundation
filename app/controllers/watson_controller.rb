# frozen_string_literal: true
require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"

class WatsonController < ApplicationController
    before_action :watson


    def watson

        # If using IAM
        authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
          apikey: "#{ENV['ibm_key']}"
        )

        # If you have username & password in your credentials use:
        # authenticator = IBMWatson::Authenticators::BasicAuthenticator.new(
        #   username: "{username}",
        #   password: "{password}"
        # )

        # If you have username & password in your credentials use:
        text_to_speech = IBMWatson::TextToSpeechV1.new(
          authenticator: authenticator
        )
        text_to_speech.service_url = "https://api.eu-gb.text-to-speech.watson.cloud.ibm.com/instances/699e576f-d321-44ec-a89c-67ae62877372"

        # puts JSON.pretty_generate(text_to_speech.list_voices.result)


        # VARAIBLES
        name = current_user.firstName
        nb_elevator = Elevator.count
        nb_building = Building.count
        nb_customer = Customer.count
        nb_inactive_elevator = Elevator.where(status: 'Inactive').count
        nb_quote = Quote.count
        nb_leads = Lead.count
        nb_battery = Battery.count
        city_list = []
        Address.all.each do |address|
            city = address.city
            city_list.push(city)
        end
        nb_city = city_list.length
        # /VARIABLES


        File.open("public/output.wav", "wb") do |audio_file|
          response = text_to_speech.synthesize(
            # text: "Hello world! #{elevator}",
            text: "Welcome #{name}! There are currently #{nb_elevator} elevators deployed in the #{nb_building} buildings of your #{nb_customer} customers. Currently, #{nb_inactive_elevator} elevators are not in Running Status and are being serviced. Moreover, You currently have #{nb_quote} quotes awaiting processing and You currently have #{nb_leads} leads in your contact requests. Finally, there is #{nb_battery} Batteries are deployed across #{nb_city} cities.",
            accept: "audio/wav",
            voice: "en-US_AllisonVoice"
          ).result
          audio_file << response
        end

    end
end