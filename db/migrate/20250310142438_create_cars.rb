class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :style
      t.integer :price
      t.integer :year
      t.string :description

      t.timestamps
    end
  end
end
