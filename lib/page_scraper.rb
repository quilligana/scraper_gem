module DaftScraper
  class PageScraper
    def initialize html
      @html = html
    end

    def price
      @html.at("#smi-summary-items div").text.gsub(/\D/, '').to_i
    end
  end
end
