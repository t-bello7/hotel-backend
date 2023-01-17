class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.text :name
      t.text :location
      t.text :email
      t.text :phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
