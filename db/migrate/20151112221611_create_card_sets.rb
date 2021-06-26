class CreateCardSets < ActiveRecord::Migration
  def change
    create_table :card_sets do |t|
      t.string :name
      t.string :code
      t.date   :release_date
      t.string :border
      t.string :type

      t.timestamps
    end
  end
end
