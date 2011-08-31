require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Daft Scraper" do
  it "should exist" do
    scraper = DaftScraper::Scrape.new
    scraper.test_method.should == "Hello"
  end
end
