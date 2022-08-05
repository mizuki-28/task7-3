class ChangeDatatypeOfUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :user_image, :image
  end
end
