class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :room_type
      t.integer :bed_count
      t.float :price
      t.boolean :reserved
      t.references :hotel, null: false, foreign_key: true
      t.integer :number

      t.timestamps
    end
  end
end
