module DaftScraper
  class PageScraper
    def initialize html
      @html = html
    end

    def price
      price_text.gsub(/\D/, '').to_i
    end

    def property_type
      @html.at("#smi-summary-items :nth-child(2)").text
    end

    private
      def price_text
        @html.at("#smi-summary-items div").text[/\u20AC[0-9,]+/]
      end
  end
end
