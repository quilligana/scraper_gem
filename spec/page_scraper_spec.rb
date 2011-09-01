# TODO look at outputting which fixture caused the error by passing an error
# message to rspec.should
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Page Scraper" do
  include DaftScraper
  before :all do
    @fixtures = [ 
      Fixture.new("clareview-park-galway"),
      Fixture.new("belmaine-dublin-13")
    ]
  end

  it "should scrape the price correctly" do
    @fixtures.each do |fixture|
      fixture.extracted.price.should == fixture.expected_price.to_i
    end
  end

  it "shoud return an integer price" do
    @fixtures.each do |fixture|
      fixture.extracted.price.class.should == Fixnum
    end
  end
end
