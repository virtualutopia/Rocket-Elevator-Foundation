class TableCustomers < ActiveRecord::Migration[5.2]
  def change
      
    create_table :customers do |t|

      t.references :user, foreign_key: true
      t.references :address, foreign_key: true
      t.timestamps
      t.string :business_name
 
      t.string :contact_full_name
      t.string :contact_phone
      t.string :contact_email
      t.string :business_description
      t.string :technician_full_name
      t.string :technician_phone
      t.string :technician_email
    end
  end
end
