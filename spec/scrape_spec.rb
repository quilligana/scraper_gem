require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Daft Scraper" do
  let(:scraper){ DaftScraper::Scrape.new }
  it "should exist" do
    scraper.test_method.should == "Hello"
  end
end
