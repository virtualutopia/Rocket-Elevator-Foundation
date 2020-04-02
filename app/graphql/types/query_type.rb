require('pg')
module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    $conn = PG.connect("host=localhost port=5432 dbname=rocketelevators_api password=psql");
    # @res = conn.exec("SELECT * FROM factintervention");
    # TODO: remove me

    field :addresses, [AddressType], null: false,
    description: "Get all the addresses"
    field :interventions, [FactinterventionType], null: false
    # description: "Get all the addresses"
    field :get_interventions, [FactinterventionType], null: false do
      argument :id, Int, required: true
    end

    def addresses
      Address.all
    end
    def interventions
      all_interventions = $conn.exec("SELECT * FROM factintervention");
    end
    def get_interventions(id:)
      xx = $conn.exec("SELECT * FROM factintervention");
      xx.find(id)
    end
  end
end
