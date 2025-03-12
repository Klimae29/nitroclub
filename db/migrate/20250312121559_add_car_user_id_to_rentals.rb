class AddCarUserIdToRentals < ActiveRecord::Migration[7.1]
  def change
    add_column :rentals, :car_user_id, :integer
    add_index :rentals, :car_user_id
  end
end
