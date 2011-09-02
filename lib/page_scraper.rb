module DaftScraper
  class PageScraper < Scraper
    def initialize(url)
      super()
      @url = url
      @agent.user_agent_alias = random_agent
    end

    def scrape
      @agent.get @url
      PageExtractor.new(@agent.page)
    end
  end
end
