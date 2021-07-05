
class CreateBinders < ActiveRecord::Migration
  def change
    create_table :binders do |t|
      t.string :name
      t.string :status
      t.belongs_to(:user, foreign_key: true)

      t.timestamps
    end
  end
end