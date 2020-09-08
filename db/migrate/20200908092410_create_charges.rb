class CreateCharges < ActiveRecord::Migration[6.0]
  def change
    create_table :charges do |t|
      t.boolean :is_completed, default: false
      t.timestamps
    end
  end
end
