module Daft
  #class ValidUrlValidator < ActiveModel::EachValidator
    #def validate_each(record, attribute, value)
      #record.errors[attribute] << "Invalid URL" if (value =~ URI::regexp).nil?
    #end
  #end

  class Url
    include ActiveModel::Validations
    include ActiveModel::Conversion
    attr_accessor :url
    def initialize url=""
      @url = url
    end
    validate :valid_url

    # TODO check that it is actually a url from the daft website
    # rather than just a URL from anywhere on the internet
    #def valid?
      #true unless (url =~ URI::regexp).nil?
    #end
    #
    def valid_url
      errors.add('url', "Invalid URL") if (url =~ URI::regexp).nil?
    end

    def to_s
      @url
    end

    # this method is needed to allow ActiveModel::Conversion to work
    def persisted?
      false
    end

    def id
      @id ||= url.match(/id=\d+/)[0].gsub(/\D/, '').to_i
    end

    # IDEA I kinda think that this pattern makes the PageScraper class
    # one abstraction too many. Should maybe move the logic from that class
    # into this method
    # TODO: deal with Mechanize errors
    def scrape
      @scrape ||= PageScraper.new(self.to_s).listing
    end
  end
end
