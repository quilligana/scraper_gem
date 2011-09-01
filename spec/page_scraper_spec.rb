require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Page Scraper" do
  include DaftScraper
  before :all do
    @fixture = Fixture.new("clareview-park-galway")
  end

  it "should scrape the price correctly" do
    @fixture.extracted.price.should == @fixture.expected_price.to_i
  end

  it "shoud return an integer price" do
    @fixture.extracted.price.class.should == Fixnum
  end
end
