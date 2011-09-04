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
end
