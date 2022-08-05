class RenameFullNameColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :full_name, :user_name
  end
end
