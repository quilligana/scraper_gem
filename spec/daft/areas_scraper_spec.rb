require "spec_helper"
describe Daft::AreasScraper do
  include Daft

  before :all do
    file_name = "fixtures/buying_search_results/clare_page_1.html"
    html_file_loc = File.expand_path(file_name)
    @url_of_daft_house = AreasScraper.new.url_for("Clare")
    FakeWeb.register_uri(:get, @url_of_daft_house, :body => File.read(html_file_loc),
                         :content_type => "text/html")
  end

  describe "scrape_county" do
    it "should return an areas extractor object" do
      AreasScraper.new.scrape_county("Clare").should be_instance_of Array
    end

    it "should get results" do
      last_area_name = AreasScraper.new.scrape_county("Clare").last.name
      last_area_name.should == "Whitegate"
    end
  end
end
