module Types
  class AddressType < BaseObject
    field :id, ID, null: true
    field :address_type, String, null: true
    field :status, String, null: true
    field :entity, String, null: true
    field :street_number_name, String, null: true
    field :apartment_number, String, null: true
    field :city, String, null: true
    field :state_province, String, null: true
    field :zip_code, String, null: true
    field :country, String, null: true
    field :notes, String, null: true
    field :lat, String, null: true
    field :lng, String, null: true
  end
end
