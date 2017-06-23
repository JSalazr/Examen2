class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :modelo
      t.string :description
      t.decimal :price_per_day
      t.string :category

      t.timestamps
    end
  end
end
