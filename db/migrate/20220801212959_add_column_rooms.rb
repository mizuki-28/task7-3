class AddColumnRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :room_title, :string
    add_reference :rooms, :user, foreign_key: true
    add_column :rooms, :room_body, :string
  end
end
