require 'geocoder'
class Address < ApplicationRecord
    after_save :get_zip
    def get_zip
        # results = Geocoder.search("Paris")
        # puts results.first.coordinates
        coord_list = []
        Address.all.each do |a|
            i = 0
            loop do
                place = a.street_number_name
                coords = Geocoder.search(place)
                i += 1
                coords.first.coordinates
            end
          end
    end
    
end