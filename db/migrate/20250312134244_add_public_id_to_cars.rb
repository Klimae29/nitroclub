class AddPublicIdToCars < ActiveRecord::Migration[7.1]
  def change
    add_column :cars, :public_id, :string
  end
end
