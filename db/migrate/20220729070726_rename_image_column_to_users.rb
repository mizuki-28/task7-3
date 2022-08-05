class RenameImageColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :image, :user_image
  end
end
