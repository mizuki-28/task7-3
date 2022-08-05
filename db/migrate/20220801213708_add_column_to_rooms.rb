class AddColumnToRooms < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :room_body, :string
    add_column :rooms, :room_price, :integer
    add_column :rooms, :room_image, :image
  end
end
