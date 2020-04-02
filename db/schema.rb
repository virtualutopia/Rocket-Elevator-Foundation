# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_10_005221) do

  create_table "addresses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "address_type"
    t.string "status"
    t.string "entity"
    t.string "street_number_name"
    t.string "apartment_number"
    t.string "city"
    t.string "state_province"
    t.string "zip_code"
    t.string "country"
    t.text "notes"
    t.string "lat"
    t.string "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "batteries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "building_id"
    t.bigint "employee_id"
    t.string "building_type"
    t.string "status"
    t.date "date_service_since"
    t.date "date_last_inspection"
    t.string "operations_certificate"
    t.text "information"
    t.text "notes"
    t.index ["building_id"], name: "index_batteries_on_building_id"
    t.index ["employee_id"], name: "index_batteries_on_employee_id"
  end

  create_table "building_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "building_id"
    t.string "information_key"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_building_details_on_building_id"
  end

  create_table "buildings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "address_id"
    t.string "building_administrator_full_name"
    t.string "building_administrator_email"
    t.string "building_administrator_phone"
    t.string "building_technical_contact_name"
    t.string "building_technical_contact_email"
    t.string "building_technical_contact_phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_buildings_on_address_id"
    t.index ["customer_id"], name: "index_buildings_on_customer_id"
  end

  create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "battery_id"
    t.string "building_type"
    t.integer "floors_served"
    t.string "status"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["battery_id"], name: "index_columns_on_battery_id"
  end

  create_table "customers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "business_name"
    t.string "contact_full_name"
    t.string "contact_phone"
    t.string "contact_email"
    t.string "business_description"
    t.string "technician_full_name"
    t.string "technician_phone"
    t.string "technician_email"
    t.index ["address_id"], name: "index_customers_on_address_id"
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "elevators", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "column_id"
    t.bigint "serial_number"
    t.string "model"
    t.string "building_type"
    t.string "status"
    t.date "date_service_since"
    t.date "date_last_inspection"
    t.string "inspection_certificate"
    t.text "information"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["column_id"], name: "index_elevators_on_column_id"
  end

  create_table "employees", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "user_id"
    t.string "email"
    t.string "firstName"
    t.string "lastName"
    t.string "job_title"
    t.string "encrypted_password", default: "", null: false
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "leads", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "full_name"
    t.string "business_name"
    t.string "email"
    t.string "phone"
    t.string "project_name"
    t.text "project_description"
    t.string "department"
    t.text "message"
    t.binary "file_attachment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "firstName"
    t.string "phoneNumber"
    t.string "companyName"
    t.string "email"
    t.string "buildingType"
    t.string "productGrade"
    t.integer "nbAppartment"
    t.integer "nbBusiness"
    t.integer "nbFloor"
    t.integer "nbBasement"
    t.integer "nbCage"
    t.integer "nbParking"
    t.integer "nbOccupantFloor"
    t.integer "nbOperatingHours"
    t.integer "nbElevatorNeeded"
    t.integer "instllationCost"
    t.integer "totalCost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "firstName"
    t.string "lastName"
    t.string "job_title"
    t.string "phoneNumber"
    t.string "companyName"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "batteries", "buildings"
  add_foreign_key "batteries", "employees"
  add_foreign_key "building_details", "buildings"
  add_foreign_key "buildings", "addresses"
  add_foreign_key "buildings", "customers"
  add_foreign_key "columns", "batteries"
  add_foreign_key "customers", "addresses"
  add_foreign_key "customers", "users"
  add_foreign_key "elevators", "columns"
  add_foreign_key "employees", "users"
end
