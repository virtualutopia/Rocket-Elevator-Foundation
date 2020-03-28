require "json"
require "ibm_watson/authenticators"
require "ibm_watson/text_to_speech_v1"
require 'http'


# If you have username & password in your credentials use:
authenticator = IBMWatson::Authenticators::BasicAuthenticator.new(
  apikey: ENV['ibm_key'],
  username: "#{ENV['imb_username']}",
  password: "#{ENV['imb_pass']}",
)

# If you have username & password in your credentials use:
text_to_speech = IBMWatson::TextToSpeechV1.new(
  authenticator: authenticator
)
text_to_speech.service_url = "https://cloud.ibm.com/docs/resources?topic=resources-services_region#paas-services"

assistant = AssistantV1.new(
  authenticator: "<authenticator>"
  version: "2017-04-21"
)

response = assistant.headers(
  "Custom-Header" => "add_default_headers"
  ).list_workspaces

p "Status: #{response.status}"
p "Headers: #{response.headers}"
p "Result: #{response.result}"

voice = text_to_speech.get_voice(
  voice: "en-US_AllisonVoice")
  
puts JSON.pretty_generate(voice.result)
File.open("welcome.mp4", "w+") do |audio_file|
  response = text_to_speech.synthesize(
    text: "Hello world!",
    accept: "audio/mp4",
    voice: "en-US_AllisonVoice"
  ).result
  audio_file << response
end
