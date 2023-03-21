require 'rails_helper'

RSpec.describe GathererScraper do
  it 'scrapes' do
    GathererScraper.scrape!('/Pages/Search/Default.aspx?set=[%22Commander%202015%22]')
  end
end
