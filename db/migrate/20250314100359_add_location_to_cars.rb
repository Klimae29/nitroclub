class AddLocationToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :location, :string
  end
end
