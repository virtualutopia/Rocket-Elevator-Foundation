module Types
  class FactinterventionType < BaseObject
    field :Id, Integer, null: true
    field :Employeeid, Integer, null: true
    field :Buildingid, Integer, null: true
    field :Batteryid, Integer, null: true
    field :Columnid, Integer, null: true
    field :Elevatorid, Integer, null: true
    field :Date_start, String, null: true
    field :Date_end, String, null: true
    field :Result, String, null: true
    field :Report, String, null: true
    field :Status, String, null: true
  end
end
