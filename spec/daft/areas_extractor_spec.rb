require "spec_helper"
describe Daft::AreasExtractor do
  include Daft

  describe "clare" do
    before :all do
      @clare = AreaFixture.new 'buying_search_results/clare_page_1'
    end

    it "should inclue Boston" do
      @clare.extracted.areas.should include "Boston"
    end

    it "should include Doolin" do
      @clare.extracted.areas.should include "Doolin"
    end

    it "should not include the county name" do
      @clare.extracted.areas.should_not include "Co. Clare"
    end
  end
end
