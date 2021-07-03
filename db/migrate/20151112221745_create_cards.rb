class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string  :artist
      t.integer :cmc
      t.string  :colors
      t.text  :flavor
      t.string  :uuid
      t.string  :image_name
      t.string  :layout
      t.string  :mana_cost
      t.string  :multiverse_id
      t.string  :name
      t.integer  :number
      t.integer  :power
      t.integer  :toughness
      t.string  :rarity
      t.text  :text
      t.string  :subtypes
      t.string  :type
      t.string  :types

      t.belongs_to(:card_set, foreign_key: true)

      t.timestamps
    end
  end
end
