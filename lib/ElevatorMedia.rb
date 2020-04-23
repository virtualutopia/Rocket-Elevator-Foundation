require 'pry-byebug'
require 'uri'
require 'net/http'
require 'openssl'
require 'open-uri'
require 'json'


module ElevatorMedia
   class Streamer
      # @canada_statistics ||= {}
      def initialize
         # attr_reader :canada_statistics
         @canada_statistics = {}
      end
      

      def APIConnect(country)
         # --- connect to the API ---
         url = URI("https://covid-193.p.rapidapi.com/statistics/?country=#{country}")
      
         http = Net::HTTP.new(url.host, url.port)
         http.use_ssl = true
         http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      
         request = Net::HTTP::Get.new(url)
         request["x-rapidapi-host"] = 'covid-193.p.rapidapi.com'
         request["x-rapidapi-key"] = ENV['RAPIDAPI_API_KEY'] #'61ada8fd11mshbacb07369033903p1534d8jsn1c87012efc9b' #ENV['RAPIDAPI_API_KEY']

         response = http.request(request)
         # p response
         json_response = JSON.parse(response.body)
         
         # raise Exception if (response.code != "200" || json_response['results'] == 0 )
         if response.code != "200" || json_response['results'] == 0
            # p "Bad Request"
            return "Bad Request"
         end
         json_response
         # --- /connect to the API ---
      end


      def getContent
         # @canada_statistics ||= {}
         @canada_statistics = self.APIConnect('Canada')
         # p @canada_statistics 
         output = 
            " <div  class=\"row alert alert-warning\">      
            <div class=\"col-md-2\">
            <br><img src=""https://rapidapi-prod-collections.s3.amazonaws.com/1934d868-b8b9-40bf-a3a0-a978f007f89d.png>
            </div><div class=\"col-md-6\">
            <h2 style=\"color:darkblue\">COVID-19 in Canada at #{@canada_statistics['response'][0]['day']}</h2>
            Active Cases: #{@canada_statistics['response'][0]['cases']['active']} <br> 
            Total Recovered:#{@canada_statistics['response'][0]['cases']['recovered']} <br> 
            Total Deaths:#{@canada_statistics['response'][0]['deaths']['total']} 
            <h2 style=\"color:darkblue\">Stay home and wash your hands</h2></div></div>"
         return output
      end
   end
end
# binding.pry{}

