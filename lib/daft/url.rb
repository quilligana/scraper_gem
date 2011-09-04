module Daft
  class Url
    attr_accessor :url
    def initialize url
      @url = url
    end

    # TODO check that it is actually a url from the daft website
    # rather than just a URL from anywhere on the internet
    def valid?
      true unless (url =~ URI::regexp).nil?
    end

    def to_s
      @url
    end

    def id
      url.match(/id=\d+/)[0].gsub(/\D/, '').to_i
    end

    # IDEA I kinda think that this pattern makes the PageScraper class
    # one abstraction too many. Should maybe move the logic from that class
    # into this method
    # TODO: deal with Mechanize errors
    def scrape
      PageScraper.new(self.to_s).listing
    end
  end
end
