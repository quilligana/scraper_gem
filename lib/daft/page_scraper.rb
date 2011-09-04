module Daft
  class PageScraper < Scraper
    def initialize(url)
      super()
      @url = url
      @agent.user_agent_alias = random_agent
    end

    def listing
      # TODO we need to deal with daft returning a 404 in here
      @listing ||= PageExtractor.new(@agent.get(@url))
    end
  end
end
