class AddCardImageUriToCard < ActiveRecord::Migration
  def change
    add_column :cards, :card_image_uri, :string
  end
end
