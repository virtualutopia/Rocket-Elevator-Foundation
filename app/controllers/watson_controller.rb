class WatsonController < ApplicationController
    before_action :watson
    
    def watson
            # frozen_string_literal: true
            
            require "json"
            require "ibm_watson/authenticators"
            require "ibm_watson/text_to_speech_v1"
            
            # If using IAM
            authenticator = IBMWatson::Authenticators::IamAuthenticator.new(
                apikey: "#{ENV['ibm_key']}"
            )
            
            # If you have username & password in your credentials use:
            # authenticator = IBMWatson::Authenticators::BasicAuthenticator.new(
                #   username: "username",
                #   password: "password"
                # )
                
                # If you have username & password in your credentials use:
                text_to_speech = IBMWatson::TextToSpeechV1.new(
                authenticator: authenticator
            )
            text_to_speech.service_url = "https://api.us-east.text-to-speech.watson.cloud.ibm.com/instances/8fbb899b-7e00-48f8-9814-73aaf74e934a"
            
            puts JSON.pretty_generate(text_to_speech.list_voices.result)

            File.open("welcome.wav", "w+") do |audio_file|
                response = text_to_speech.synthesize(
                text: "Hello world #{xx} world Hello world Hello world Hello world Hello world Hello world Hello world Hello world !",
                accept: "audio/wav",
                voice: "en-US_AllisonVoice"
                ).result
                audio_file << response
            end
    end
end
