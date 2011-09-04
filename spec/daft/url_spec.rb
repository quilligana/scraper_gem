require "spec_helper"

describe Daft::Url do
  include Daft
  describe "valid?" do
    it "should return true if the url is valid" do
      url = "http://www.daft.ie/searchrental.daft?id=123456"
      Url.new(url).should be_valid
    end

    it "should return true if the url is valid" do
      url = "Totally invalid URL"
      Url.new(url).should_not be_valid
    end
  end

  describe "to_s" do
    it "should return the url" do
      url = "http://www.daft.ie/searchrental.daft?id=123456"
      Url.new(url).to_s.should == url
    end
  end

  describe "id" do
    let(:rental_url){ "http://www.daft.ie/searchrental.daft?id=1074495" }
    let(:sale_url){ "http://www.daft.ie/searchsale.daft?id=604241" }

    it "should return a Fixnum" do
      daft_id = Url.new(rental_url).id
      daft_id.should be_instance_of Fixnum
    end

    it "should extract the daft_id from a rental url" do
      daft_id = Url.new(rental_url).id
      daft_id.should == 1074495
    end

    it "should extract the daft_id from a selling url" do
      daft_id = Url.new(sale_url).id
      daft_id.should == 604241
    end
  end
end
