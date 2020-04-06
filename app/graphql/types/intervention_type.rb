module Types
  class InterventionType < BaseObject
    field :Id, ID, null: true
    field :Employeeid, ID, null: true
    field :Buildingid, ID, null: true
    field :Batteryid, ID, null: true
    field :Columnid, ID, null: true
    field :Elevatorid, ID, null: true
    field :Date_start, String, null: true
    field :Date_end, String, null: true
    field :Result, String, null: true
    field :Report, String, null: true
    field :Status, String, null: true
    field :address, [AddressType], null: false
  end
end
