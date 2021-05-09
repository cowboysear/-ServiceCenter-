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

    # Cards are listed in .cardItemTable, .cardItem represents an 