require "spec_helper"

describe Daft::Scraper do
  include Daft
  let(:scraper){ Scraper.new }

  it "should start up a Mechanize agent on intialization" do
    scraper.agent.class.should == Mechanize
  end

  it "should have an AGENT_ALIASES constant" do
    Scraper.const_defined?(:VIABLE_ALIASES).should be_true 
  end

  it "should add some modern aliases to Mechanize on startup" do
    Mechanize::AGENT_ALIASES.should include "Win7 Safari3"
  end

  describe "random_alias" do
    it "should return an alias from the VIABLE_ALIASES array" do
      Scraper::VIABLE_ALIASES.should include scraper.random_agent
    end
  end

  describe "add_alias" do
    let(:alias_name){ "the name" }

    it "should add the specified alias to the Mechanize::AGENT_ALIASES array" do
      scraper.add_alias(alias_name, "header")
      Mechanize::AGENT_ALIASES.should include alias_name
    end

    it "should add the alias to the VIABLE_ALIASES array also" do
      scraper.add_alias(alias_name, "header")
      Scraper::VIABLE_ALIASES.should include alias_name
    end
  end
end
