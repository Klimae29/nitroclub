class ChangeColumnDescriptionFromCars < ActiveRecord::Migration[7.1]
  def change
    change_column :cars, :description, :text
  end
end
