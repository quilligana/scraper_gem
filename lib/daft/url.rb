module Daft
  class Url
    attr_accessor :url
    def initialize url
      @url = url
    end

    def valid?
      true unless (url =~ URI::regexp).nil?
    end
  end
end
