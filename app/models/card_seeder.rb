class CardSeeder
  def self.seed_card_set_from_json(file_name)
    opened_file = File.read(file_name)
    card_set_in_json = JSON.parse(opened_file)

    new_card_set = CardSet.create(
      name: card_set_in_json['name'],
      code: card_set_in_json['code'],
      release_date: card_set_in_json['releas