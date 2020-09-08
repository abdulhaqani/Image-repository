class AddInventoryToImages < ActiveRecord::Migration[6.0]
  def change
    add_column :images, :inventory, :number
  end
end
