class AddBoookingReferenceToRooms < ActiveRecord::Migration[7.0]
  def change
    add_reference :rooms, :booking, null: false, foreign_key: true
  end
end
