class AddPeopleToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :people, :integer
    add_column :reservations, :start_at, :date
    add_column :reservations, :end_at, :date
  end
end
