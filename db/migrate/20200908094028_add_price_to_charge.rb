class AddPriceToCharge < ActiveRecord::Migration[6.0]
  def change
    add_column :charges, :price, :decimal
  end
end
