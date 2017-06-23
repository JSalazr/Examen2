class CreateRents < ActiveRecord::Migration[5.0]
  def change
    create_table :rents do |t|
      t.text :client
      t.decimal :total
      t.integer :days
      t.string :rent_start_at
      t.string :rent_end_at

      t.timestamps
    end
  end
end
