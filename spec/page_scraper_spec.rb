require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Page Scraper" do
  include DaftScraper

  it "should create a listing" do
    listing = Listing.create! address: "This is the address"
    listing.address.should == "This is the address"
  end
end
