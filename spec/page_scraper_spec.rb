require "spec_helper"

describe DaftScraper::PageScraper do
  include DaftScraper
  before :each do
    html_file_loc = File.expand_path("fixtures/belmaine-dublin-13.html")
    @url_of_daft_house = "http://www.daft.ie/searchrental.daft?id=1074495"
    FakeWeb.register_uri(:get, @url_of_daft_house, :body => File.read(html_file_loc),
                         :content_type => "text/html")
  end

  describe "scrape" do
    before :each do
      @scraper = PageScraper.new(@url_of_daft_house)
    end

    it "should return a PageExtractor object" do
      @scraper.listing.class.should == PageExtractor
    end

    it "should make the price of the house accessible" do
      @scraper.listing.price.should == 850
    end
  end
end
