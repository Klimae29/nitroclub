class AddUserForeignKeyToModels < ActiveRecord::Migration[7.1]
  def change
    add_reference :cars, :user, null: false, foreign_key: true
    add_reference :rentals, :user, null: false, foreign_key: true
  end
end
