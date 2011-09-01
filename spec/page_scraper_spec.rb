# TODO look at outputting which fixture caused the error by passing an error
# message to rspec.should
require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Page Scraper" do
  include DaftScraper
  before :all do
    @fixtures = [ 
      Fixture.new("clareview-park-galway"),
      Fixture.new("malachy-conlon-park-armagh"),
      Fixture.new("belmaine-dublin-13")
    ]
  end

  describe "bedroom extraction" do
    it "should return a Fixnum" do
      @fixtures.each do |f|
        f.extracted.bedrooms.class.should == Fixnum
      end
    end

    it "should return the correct number of rooms" do
      @fixtures.each do |f|
        f.extracted.bedrooms.should == f.expected_bedrooms.to_i
      end
    end
  end

  describe "property_type extraction" do
    it "should return the correct type" do
      @fixtures.each do |f|
        f.extracted.property_type.should == f.expected_property_type
      end
    end
  end

  describe "price extraction" do
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
end
