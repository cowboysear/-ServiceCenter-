# == Schema Information
#
# Table name: cards
#
#  id            :integer          not null, primary key
#  artist        :string(255)
#  cmc           :integer
#  colors        :string(255)
#  flavor        :text(65535)
#  uuid          :string(255)
#  image_name    :string(255)
#  layout        :string(255)
#  mana_cost     :string(255)
#  multiverse_id :string(255)
#  name          :string(255)
#  number        :integer
#  power         :integer
#  toughness     :integer
#  rarity        :string(255)
#  text          :text(65535)
#  subtypes      :string(255)
#  type          :string(255)
#  types         :string(255)
#  card_set_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#

require 'rails_helper'

RSpec.describe Card, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
