# == Schema Information
#
# Table name: card_sets
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  code         :string(255)
#  release_date :date
#  border       :string(255)
#  type         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class CardSet < ActiveRecord::Base
  validates :name, presence: true
  validates :code, presence: true
  validates :release_date, presence: true
  validates :border, presence: true

  has_many :cards

  # disable inheritance column since we have a 'type' field
  self.inheritance_column = 'somthing_not_type'
end
