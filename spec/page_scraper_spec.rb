require "spec_helper"

describe DaftScraper::PageScraper do
  include DaftScraper
  before :all do
    html_file_loc = File.expand_path("fixtures/belmaine-dublin-13.html")
    @url_of_daft_house = "http://http://www.daft.ie/searchrental.daft?id=1074495"
    FakeWeb.register_uri(:get, @url_of_daft_house, :body => File.open(html_file_loc))
  end

  describe "scrape" do
    before :each do
      @scraper = PageScraper.new(@url_of_daft_house)
    end
    it "should return a PageExtractor object" do
      @scraper.scrape.class.should == PageExtractor
    end

    it "should make the price of the house accessible" do
      @scraper.scrape.price.should == 850
    end
  end
end
