require 'rails_helper'

RSpec.describe CardSeeder do
  it 'seeds cards' do
    CardSeeder.seed_card_set_from_json('./spec/support/C15.json')
    expect(CardSet.count).to eq 1
    expect(Card.count).to be > 1
  end
end
