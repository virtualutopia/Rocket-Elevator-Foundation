class GmapController < ApplicationController

before_action :authenticate_user!, :gmap

def authorize_admin
    @current_user.try(:title) != "employee"
        flash[:error] = "ACCES DENIED"
        return redirect_to request.referrer || "/index"
  end

    def gmap
        @marks = []
        Building.all.each do |building|

            @building = Building.all
            @address = Address.all
            @building_num = Building.all.count
            # VARIABLES
            address_id = building.address_id #Find the building id
            @building_street_number_name = Address.find(address_id).street_number_name #Find the position

            @lat = Address.find(address_id).lat #Coord 1
            @lng = Address.find(address_id).lng #coord 2

            customer_id = building.customer_id #find the customer id
            @customer_name = Customer.find(customer_id).contact_full_name #find the customer name

            @number_battery = Battery.where(building_id: building.id).count #number of battery
            battery_ids = Battery.where(building_id: building.id).ids #find the ids linked to the building 
            @number_column = Column.where(battery_id: battery_ids).count #find the number of column linked to the batteries
            column_ids = Column.where(battery_id: battery_ids).ids #find the column
            @number_elevator = Elevator.where(column_id: column_ids).count #find the number of elevator per column

            @technician_name = Building.find(building.id).building_technical_contact_name #find the technician name
            # /VARIABLES
            
        end

    end
end
