

require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
include IBMWatson

authenticator = Authenticators::IamAuthenticator.new(
  apikey: ENV['WATSON_API_KEY']
)

text_to_speech = TextToSpeechV1.new(
  authenticator: authenticator
)
text_to_speech.service_url = ENV['WATSON_URL']

File.new("hello_world.wav", "wb") do |audio_file|
  response = text_to_speech.synthesize(
    text: "Hello world",
    accept: "audio/wav",
    voice: "en-US_AllisonV3Voice"
  ).result
  
  audio_file << response
end



