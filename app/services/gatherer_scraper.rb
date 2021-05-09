require 'open-uri'
require 'nokogiri'

# Scrapes Gatherer's API for images
class GathererScraper
  GATHERER_URL = 'http://gatherer.wizards.com/Pages/Search/Default.aspx?'

  def self.scrape!(uri)
    new.scrape!(uri)
  end

  def scrape!(uri)
    parsed_html = Nokogiri::HTML(open("http://gatherer.wizards.com#{uri}"))

    # Cards are listed in .cardItemTable, .cardItem represents an individual card. We iterate over it to get the card_image_uri
    card_items = parsed_html.css('.cardItem')
    card_items.each do |ci|
      image_uri = ci.search('img').first.attributes['src'].value
      card_name = ci.css('.cardTitle').children.last.children.text

      Card.where(name: card_name).update_all(card_i