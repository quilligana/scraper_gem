module Daft
  class Scraper
    attr_reader :agent
    # Need to constrain the User Aliases Mechanize can use, otherwise it
    # might decide to use an iPhone User Agent. If that happened, we would be served
    # different HTML
    VIABLE_ALIASES = ["Windows IE 6", "Windows IE 7", "Windows Mozilla", "Mac Safari",
                     "Mac FireFox", "Mac Mozilla"]

    def initialize
      @agent = Mechanize.new
      add_modern_aliases
    end

    def add_alias name, header
      Mechanize::AGENT_ALIASES[name] = header
      VIABLE_ALIASES << name
    end

    # IDEA add the array.sample method from ActiveSupport and use it here
    def random_agent
      VIABLE_ALIASES[rand(VIABLE_ALIASES.size)]
    end

    private
      # The mechanize aliases are outdated and therefore maight be suspicious
      # The list of them is rather small too.
      def add_modern_aliases
        add_alias "Win7 Safari3",
          "Mozilla/5.0 (Windows; U; Windows NT 6.1; da) AppleWebKit/522.15.5 (KHTML, like Gecko) Version/3.0.3 Safari/522.15.5"
        add_alias "WinXP Safari3", "Mozilla/5.0 (Windows; U; Windows NT 5.1; id) AppleWebKit/522.11.3 (KHTML, like Gecko) Version/3.0 Safari/522.11.3"
        add_alias "Mac Safari4", "Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_1; zh-CN) AppleWebKit/530.19.2 (KHTML, like Gecko) Version/4.0.2 Safari/530.19"
      end
  end
end
