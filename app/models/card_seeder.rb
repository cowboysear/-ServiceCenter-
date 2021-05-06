class CardSeeder
  def self.seed_card_set_from_json(file_name)
    opened_file = File.read(file_name)
    card_set_in_json = JSON.parse(opened_file)

    new_card_set = CardSet.create(
      name: card_set_in_json['name'],
      code: card_set_in_json['code'],
      release_date: card_set_in_json['releaseDate'],
      border: card_set_in_json['border'],
      type: card_set_in_json['type']
    )

    card_set_in_json['cards'].each do |card|
      new_card_set.cards.create(
        artist: card['artist'],
        cmc: card['cmc'],
        colors: card['colors'],
        flavor: card['flavor'],
        uuid: card['id'],
        image_name: card['imageName'],
        layout: card['layout'],
        mana_cost: card['manaCost'],
        multiverse_id: card['multiverseid'],
        name: card['name'],
        number: card['number'],
        power: card['power'],
        rarity: card['rarity'],
        subtypes: card['subtypes'],
        text: card['text'],
        toughness: card['toughness'],
        type: card['type'],
        types: card['types']
      )
    end
  end
end
