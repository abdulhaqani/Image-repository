class AddUserIdAndImageIdToCharges < ActiveRecord::Migration[6.0]
  def change
    add_column :charges, :image_id, :int
    add_column :charges, :user_id, :int
  end
end
