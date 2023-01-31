# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_125_182_636) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'bookings', force: :cascade do |t|
    t.integer 'days'
    t.datetime 'booking_date'
    t.float 'amount'
    t.bigint 'room_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.bigint 'hotel_id', null: false
    t.index ['hotel_id'], name: 'index_bookings_on_hotel_id'
    t.index ['room_id'], name: 'index_bookings_on_room_id'
    t.index ['user_id'], name: 'index_bookings_on_user_id'
  end

  create_table 'hotels', force: :cascade do |t|
    t.string 'name'
    t.string 'location'
    t.string 'email'
    t.string 'phone_number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id', null: false
    t.index ['user_id'], name: 'index_hotels_on_user_id'
  end

  create_table 'rooms', force: :cascade do |t|
    t.string 'name'
    t.string 'room_type'
    t.integer 'bed_count'
    t.float 'price'
    t.boolean 'reserved'
    t.bigint 'hotel_id', null: false
    t.integer 'number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['hotel_id'], name: 'index_rooms_on_hotel_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'username'
    t.string 'email'
    t.string 'password'
    t.string 'role'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'password_digest'
  end

  add_foreign_key 'bookings', 'hotels'
  add_foreign_key 'bookings', 'rooms'
  add_foreign_key 'bookings', 'users'
  add_foreign_key 'hotels', 'users'
  add_foreign_key 'rooms', 'hotels'
end
