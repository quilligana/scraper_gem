module Daft
  class Url
    attr_accessor :url
    def initialize url
      @url = url
    end

    def valid?
      true unless (url =~ URI::regexp).nil?
    end

    def to_s
      @url
    end

    def id
      url.match(/id=\d+/)[0].gsub(/\D/, '').to_i
    end
  end
end
