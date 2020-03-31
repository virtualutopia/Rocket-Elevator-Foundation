require('pg')
require 'faker'

 namespace :dataTransfert do

  desc "Data transfert"

    # TASK FOR CREATION OF DB AND TABLE IN postgresql


    task create_psql_db: :environment do
      conn = PG.connect("host=localhost port=5432 dbname=postgres user=felix password=ubuntu01 ");
      conn.exec("CREATE DATABASE rocketelevators_api");
    end

    task create_pg_table: :environment do
      conn = PG.connect("host=localhost port=5432 dbname=rocketelevators_api user=felix password=ubuntu01 ");
      conn.exec("
      CREATE TABLE factquotes(
          quote_id INT PRIMARY KEY,
          creation_date DATE NOT NULL,
          business_name VARCHAR (355) NOT NULL,
          email VARCHAR (355) NOT NULL,
          nb_elevator INT NOT NULL
       );
       CREATE TABLE factcontact(
          contact_id INT PRIMARY KEY,
          creation_date DATE NOT NULL,
          business_name VARCHAR (355) NOT NULL,
          email VARCHAR (355) NOT NULL,
          procject_name VARCHAR (355) NOT NULL
       );
       CREATE TABLE factelevator(
          serial_number BIGINT PRIMARY KEY,
          commissioning_date DATE NOT NULL,
          building_id INT NOT NULL,
          customer_id INT NOT NULL,
          city VARCHAR (355) NOT NULL
       );
       CREATE TABLE dimcustomers(
          creation_date DATE NOT NULL,
          business_name VARCHAR (355) NOT NULL,
          full_user_name VARCHAR (355) NOT NULL,
          email VARCHAR (355) NOT NULL,
          number_elevators INT NOT NULL,
          city VARCHAR (355) NOT NULL
       );
       CREATE TABLE factIntervention(
          EmployeeID INT NOT NULL,
          BuildingID INT NOT NULL,
          BatteryID INT,
          ColumnID INT,
          ElevatorID INT,
          Date_start  DATE NOT NULL,
          Date_end  DATE,
          Result VARCHAR (355) NOT NULL,
          Report VARCHAR (355) NOT NULL,
          Status VARCHAR (355) NOT NULL
       );
       ")
    end

##################################################################################################|
# https://stackoverflow.com/questions/42514451/how-to-insert-into-postgres-table-with-the-pg-gem  |
# conn.exec ("TRUNCATE factquotes RESTART IDENTITY")                                              |
# LOOP DO                                                                                         |
# conn.exec('INSERT INTO TABLE_name (NAME_COLUMN_ONE, NAME_COLUMN_TWO....)                        |
#VALUES ( #{@product_id},'#{@product_name}', '#{@guk_name}'                                       |
#SI UN INTEGER NE  pas mettre de quote                                                            |
##################################################################################################|


    task transfer_for_fact: :environment do
      
      #   conn = PG::Connection.open(host: "localhost", port: 5432, dbname:"rocket_elevators_information_system_development_psql", user:"postgres", password:"root")
      conn = PG::Connection.open(host: "localhost", port: 5432, dbname:"rocketelevatorsapi", user:"groovy6879", password:"root")
      
      
      conn.exec ("TRUNCATE factquotes RESTART IDENTITY")
      Quote.all.each do |quote|
        conn.exec( "INSERT INTO factquotes (quote_id, creation_date, business_name, email, nb_elevator )
        VALUES (#{quote.id}, '#{quote.created_at}', '#{quote.companyName}', '#{quote.email}', '#{quote.nbElevatorNeeded}')")
        
      end
      
      
      conn.exec ("TRUNCATE factcontact RESTART IDENTITY")
      Lead.all.each do |lead|
        conn.exec( "INSERT INTO factcontact (contact_id, creation_date, business_name, email, procject_name )
        VALUES (#{lead.id}, '#{lead.created_at}', '#{lead.business_name}', '#{lead.email}', '#{lead.project_name}')")
      end

      
      conn.exec ("TRUNCATE factelevator RESTART IDENTITY")
      Elevator.all.each do |elevator|
        conn.exec( "INSERT INTO factelevator (serial_number, commissioning_date, building_id, customer_id, city )
        VALUES (#{elevator.serial_number}, '#{elevator.date_service_since}', '#{elevator.column.battery.building.id}', '#{elevator.column.battery.building.customer_id}', '#{elevator.column.battery.building.address.city}')")
   
      end
      
      
      conn.exec ("TRUNCATE dimcustomers RESTART IDENTITY")
      
      Customer.all.each do |customer|
        
        nbElevator = 0
        
        customer.buildings.all.each do |building|
          
          building.batteries.all.each do |battery|
            
            battery.columns.all.each do |column|
              
              nbElevator += column.elevators.count
              
            end
          end
        end
        
        conn.exec( "INSERT INTO dimcustomers (creation_date, business_name, full_user_name, email, number_elevators, city )
        VALUES ('#{customer.created_at}', '#{customer.business_name}', '#{customer.contact_full_name}', '#{customer.contact_email}',  '#{nbElevator}', '#{customer.address.city}')")
        
      end
      
    end
    
    task newTableData: :environment do
      
      conn = PG::Connection.open(host: "localhost", port: 5432, dbname:"rocketelevators_api", user:"felix", password:"ubuntu01")
      conn.exec ("TRUNCATE dimcustomers RESTART IDENTITY")   
      intervention_elevator = Elevator.where(status: 'Intervention')
      intervention_elevator.all.each do |elevator|
        _ElevatorID = elevator.id
        _ColumnID = elevator.column_id
        _BatteryID = Column.find(_ColumnID).battery_id
        _BuildingID = Battery.find(_BatteryID).building_id
        _EmployeeID = Battery.find(_BatteryID).employee_id
        _Date_start  = rand(5.days.ago..3.day.ago).to_date
        _Date_end  = rand(2.day.ago..1.hour.ago).to_date
        _Result = [:Success, :Echec, :Incomplete].sample
        _Status = [:Pending, :InProgress, :Interrupted, :Resumed, :Complete].sample

        if _Result == :Success then
          _Status = :Complete
       elsif _Result == :Echec then
           _Status = :Interrupted
           _Date_end =  _Date_start
       elsif _Result == :Incomplete then
          _Status = [:Pending, :InProgress, :Resumed].sample
          _Date_end =  _Date_start
       end

        _Report = Faker::Lorem.paragraphs(number: 1)

        
        conn.exec( "INSERT INTO factintervention (employeeid, buildingid, batteryid, columnid, elevatorid, date_start, date_end, result, report, status )
        VALUES ('#{_EmployeeID}', '#{_BuildingID}', '#{_BatteryID}', '#{_ColumnID}', '#{_ElevatorID}', '#{_Date_start}', '#{_Date_end}', '#{_Result}', '#{_Report}', '#{_Status}')")
      end
    end

    
  end
  
