class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :style
      t.integer :price
      t.integer :year
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
