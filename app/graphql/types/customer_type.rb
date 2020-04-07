module Types
  class CustomerType < Types::BaseObject
    field :user, String, null: true
    field :address, [AddressType], null: true
    field :business_name, String, null: true
    field :contact_full_name, String, null: true
    field :contact_phone, String, null: true
    field :contact_email, String, null: true
    field :business_description, String, null: true
    field :technician_full_name, String, null: true
    field :technician_phone, String, null: true
    field :technician_email, String, null: true
  end
end
