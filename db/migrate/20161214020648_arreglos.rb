class Arreglos < ActiveRecord::Migration[5.0]
  def change
    remove_column :rents, :rent_start
    add_column :rents, :rent_start_at, :date
    add_column :rents, :rent_end_at, :date
    add_column :rents, :car_id, :integer
    add_column :cars, :owner_id, :integer
  end
end
