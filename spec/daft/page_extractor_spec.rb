# TODO look at outputting which fixture caused the error by passing an error
# message to rspec.should
require "spec_helper"

describe Daft::PageExtractor do
  include Daft
  before :all do
    @fixtures = [ 
      Fixture.new("clareview-park-galway"),
      Fixture.new("malachy-conlon-park-armagh"),
      Fixture.new("belmaine-dublin-13"),
      Fixture.new("roseville-heights-donegal"),
    ]
  end

  describe "photo url extraction" do
    it "should return an array" do
      @fixtures.each do |f|
        f.extracted.photos.should be_instance_of Array
      end
    end

    it "should get the correct number of photos" do
      @fixtures.each do |f|
        f.extracted.photos.size.should == f.expected_photo_count.to_i
      end
    end
  end

  describe "agent_phone extraction" do
    it "should return a string" do
      @fixtures.each do |f|
        f.extracted.agent_phone.should be_instance_of String
      end
    end

    it "should return the correct agent phone" do
      @fixtures.each do |f|
        f.extracted.agent_phone.should == f.expected_agent_phone
      end
    end
  end

  describe "agent name extraction" do
    it "should return a string" do
      @fixtures.each do |f|
        f.extracted.agent_name.should be_instance_of String
      end
    end

    it "should return the correct agent name" do
      @fixtures.each do |f|
        f.extracted.agent_name.should == f.expected_agent_name
      end
    end
  end

  describe "daft_id extraction" do
    it "should return a Fixnum" do
      @fixtures.each do |f|
        f.extracted.daft_id.class.should == Fixnum
      end
    end

    it "should return the correct daft_id" do
      @fixtures.each do |f|
        f.extracted.daft_id.should == f.expected_daft_id.to_i
      end
    end
  end

  describe "address extraction" do
    it "should return the correct address" do
      @fixtures.each do |f|
        f.extracted.address.should == f.expected_address
      end
    end
  end

  describe "bathroom extraction" do
    it "should return a Fixnum" do
      @fixtures.each do |f|
        f.extracted.bathrooms.class.should == Fixnum
      end
    end

    it "should return the correct number of bathrooms" do
      @fixtures.each do |f|
        f.extracted.bathrooms.should == f.expected_bathrooms.to_i
      end
    end
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
