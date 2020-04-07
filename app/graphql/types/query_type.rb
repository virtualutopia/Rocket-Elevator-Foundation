require('pg')
module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    $conn = PG.connect("host=localhost port=5432 dbname=rocketelevators_api password=psql");

    field :interventions, [InterventionType], null: false do
      argument :id, ID, required: true
    end
    
        def interventions(id:)
          $conn.exec("SELECT * FROM factintervention where id = #{id}")
        end
      
    field :addresses, [AddressType], null: false 
      
        def addresses
          Address.all
        end

  end
end


# Retrieving the address of the building, the beginning and the end of the intervention for a specific intervention.
# Retrieving customer information and the list of interventions that took place for a specific building
# Retrieval of all interventions carried out by a specified employee with the buildings associated with these interventions including the details (Table BuildingDetails) associated with these buildings.