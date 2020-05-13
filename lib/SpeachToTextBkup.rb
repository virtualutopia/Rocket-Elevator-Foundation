require 'pry-byebug'
require 'net/http'
require 'uri'


module MachineLearning
   class SpeechToText
      def GetToken
         uri = URI('https://eastus.api.cognitive.microsoft.com/sts/v1.0/issuetoken')
         uri.query = URI.encode_www_form({
         })

         request = Net::HTTP::Post.new(uri.request_uri)
         # Request headers
         request['Ocp-Apim-Subscription-Key'] = ENV['subscription key']
         # Request body
         # request.body = "{body}"

         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
         end
         puts "========== status =========="
         puts response.header
         puts response.code

         puts "========== body =========="
         puts response.body
         response.body
      end

      def PostUploadFile
         uri = URI('https://eastus.api.cognitive.microsoft.com/speechtotext/v2.0/datasets/upload')
         uri.query = URI.encode_www_form({
         })

         request = Net::HTTP::Post.new(uri.request_uri)
         # Request headers
         request['Content-Type'] = 'multipart/form-data'
         # Request headers
         p ENV['subscription key']
         request['Ocp-Apim-Subscription-Key'] = ENV['subscription key']
         # read file 
         pathName = "/Users/codeboxx/Documents/playground/Azure_speech/voices/"
         fileName = "voice1"
         # Open a voice and change it into binary (.bin) it will be sent as the REQEST body
         File.open("#{pathName}#{fileName}.wav") do |aFile|
            file_data = aFile.read
            bin_file = File.new("#{fileName}.bin", "w+")
            bin_file.puts(file_data.unpack('b*'))
            puts "========== bin_file =========="
            @body = bin_file.read
            puts @body
            bin_file.close
         end
         
         request.body = "#{@body}"

         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
         end
         puts "========== status =========="
         puts response.header
         puts response.header.message
         puts response.code

         puts "========== body =========="
         puts response.body

         if response.code != "200" 
            return response.header.message
         end
         response.code
      end
      
      def SpeachRecognition
         # REGION_IDENTIFIER = "eastus"
         region_identifier = "eastus"
         uri = URI("https://#{region_identifier}.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?cid=9d218f5c-5e15-47c3-9442-85b30366f7b6")
         # uri.query = URI.encode_www_form({
         # })

         # request = Net::HTTP.new(uri.host, uri.port)
         # request.use_ssl = true
         request = Net::HTTP::Post.new(uri.request_uri)
         # Request headers
         request['Content-Type'] = 'multipart/form-data'
         # Request headers
         p ENV['subscription key']
         request['Ocp-Apim-Subscription-Key'] = ENV['subscription keyS0']
         # Request body
         pathName = "/Users/codeboxx/Documents/playground/Azure_speech/voices/"
         fileName = "voice1"
         File.open("#{pathName}#{fileName}.wav") do |aFile|
            @file_data = "#{aFile.read}"
         end
         request.body = @file_data

         response = Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') do |http|
            http.request(request)
         end
         puts "========== status =========="
         puts response.header
         puts response.code

         puts "========== body =========="
         puts response.body
         response.body
      end

      def STT
         # source code from : https://eastus.dev.cognitive.microsoft.com/docs/services/speech-to-text-api-v2-0/operations/CreateTranscription
         # original URL: https://eastus.api.cognitive.microsoft.com/speechtotext/v2.0/transcriptions
         # the follwoing url is from Speech Studio

         url = URI("https://eastus.stt.speech.microsoft.com/speech/recognition/conversation/cognitiveservices/v1?cid=9d218f5c-5e15-47c3-9442-85b30366f7b6")

         https = Net::HTTP.new(url.host, url.port);
         https.use_ssl = true
         
         request = Net::HTTP::Post.new(url)
         request["Ocp-Apim-Subscription-Key"] = "7768b0b8526f4ba4977b9c6f0f471ddb"
         request["Content-Type"] = "audio/wave"
         # Request body
         pathName = "/Users/codeboxx/Documents/playground/Azure_speech/voices/"
         fileName = "conv60-money doesn't matter.wav"
         File.open("#{pathName}#{fileName}") do |aFile|
            @file_data = "#{aFile.read}"
         end
         request.body = @file_data
         
         response = https.request(request)
         puts response.read_body
         
         parsed_json = ActiveSupport::JSON.decode(response.body) 
         extracted_text = parsed_json['DisplayText']
         puts "========== status =========="
         puts response.header
         puts response.code

         puts "========== body =========="

         puts extracted_text
         extracted_text
      end

      def STT_test
         url = URI("https://eastus.api.cognitive.microsoft.com/speechtotext/v2.0/transcriptions")

         https = Net::HTTP.new(url.host, url.port);
         https.use_ssl = true

         request = Net::HTTP::Post.new(url)
         request["Ocp-Apim-Subscription-Key"] = "7768b0b8526f4ba4977b9c6f0f471ddb"
         request["Content-Type"] = "application/json"
         request.body = "{\n    \"recordingsUrl\": \"https://drive.google.com/open?id=1QWov-MkaISG8DF3bhOHSF6a7b8ey3lAw\",\n    \"models\": [],\n    \"locale\": \"en-US\",\n    \"name\": \"Transcription using locale en-US\",\n    \"description\": \"An optional description of the transcription.\",\n    \"properties\": {\n        \"AddWordLevelTimestamps\": \"True\",\n        \"AddDiarization\": \"True\",\n        \"AddSentiment\": \"True\",\n        \"ProfanityFilterMode\": \"Masked\",\n        \"PunctuationMode\": \"DictatedAndAutomatic\"\n    }\n}"

         response = https.request(request)
         puts "========== response =========="
         puts response.read_body
         puts "========== status =========="
         puts response.header
         puts response.code

         puts "========== body =========="
         puts response.body
         response.body
      end
   end
end