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

FactoryGirl.define do
  factory :card_set do
    
  end

end
