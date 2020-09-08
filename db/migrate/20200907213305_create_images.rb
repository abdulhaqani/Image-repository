class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :title
      t.string :source
      t.decimal :price
      t.boolean :public
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
