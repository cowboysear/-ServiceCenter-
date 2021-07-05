class CreateSellables < ActiveRecord::Migration
  def change
    create_table :sellables do |t|
      t.belongs_to(:binder, foreign_key: true)
      t.belongs_to(:card)
      t.string :name
      t.integer :quantity
      t.decimal :price

      t.timestamps null: false
    end
  end
end
