require "spec_helper"

describe PageScraper do
  describe "scrape" do
    it "should return a PageExtractor object" do
      scraper = PageScraper.new(@url_of_daft_house)
      scraper.scrape.class.should == PageExtractor
    end
  end
end
