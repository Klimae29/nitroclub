class RemoveImageKeyFromCars < ActiveRecord::Migration[7.1]
  def change
    remove_column :cars, :image_key, :string
  end
end
