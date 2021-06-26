class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string  :artist
      t.integer :cmc
      t.string  :colors
      t