require "spec_helper"
describe Daft::AreasExtractor do
  include Daft

  describe "clare" do
    before :each do
      @clare = AreaFixture.new 'buying_search_results/clare_page_1'
    end

    it "should inclue Boston" do
      @clare.extracted.areas.should include_area "Boston"
    end

    it "should include Doolin" do
      @clare.extracted.areas.should include_area "Doolin"
    end

    it "should not include the county name" do
      @clare.extracted.areas.should_not include_area "Co. Clare"
    end

    it "should take a block" do
      @clare.extracted.areas.each do |area|
        area.should be_instance_of AreaOption
      end
    end
  end
end
