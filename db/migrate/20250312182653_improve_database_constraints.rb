class ImproveDatabaseConstraints < ActiveRecord::Migration[7.1]
  def change
    add_column :rentals, :owner_id, :bigint, null: false
    change_column_default :rentals, :status, "pending"

    execute "ALTER TABLE rentals ADD CONSTRAINT check_dates CHECK (end_date > start_date);"
    execute "ALTER TABLE cars ADD CONSTRAINT check_price CHECK (price >= 0);"
    execute "ALTER TABLE cars ADD CONSTRAINT check_year CHECK (year >= 1900 AND year <= EXTRACT(YEAR FROM NOW()));"

    add_foreign_key "cars", "users", on_delete: :cascade unless foreign_key_exists?(:cars, :users)
    add_foreign_key "rentals", "cars", on_delete: :cascade unless foreign_key_exists?(:rentals, :cars)
    add_foreign_key "rentals", "users", on_delete: :cascade unless foreign_key_exists?(:rentals, :users)
    add_foreign_key "rentals", "users", column: "owner_id", on_delete: :cascade unless foreign_key_exists?(:rentals, :users, column: "owner_id")
  end
end
