
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

require 'rails_helper'

RSpec.describe CardSet, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end