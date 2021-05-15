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

      Card.where(name: card_name).update_all(card_image_uri: "/#{image_uri.split("/")[2..3].join("/")}")

    end

    # This conditional evaluates to true whenever you are at "the last page" of the search results, might change in the future. Finish scraping.
    if parsed_html.css('.pagingcontrols').xpath('//span[@style="visibility:hidden;"]').present?
      return false
    else
      # Otherwise, scrape the next page.
      current_uri = parsed_html.css('.pagingcontrols').xpath('//a[@style="text-decoration:underline;"]').first['href']

      current_page_number = /aspx\?page=(?<page>[0-9]+)/.match(current_uri)[:page].to_i
      next_page_number_string = "aspx?page=#{current_page_number + 1}"
      next_page_uri = current_uri.gsub(/aspx\?page=[0-9]+/, next_page_number_string)
      self.scrape!(next_page_uri)
    end
  end
end
