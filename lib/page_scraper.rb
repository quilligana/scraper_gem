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

    def bedrooms
      @html.at("#smi-summary-items :nth-child(4)").text[/\d/].to_i
    end

    def bathrooms
      @html.at("#smi-summary-items :nth-child(6)").text[/\d/].to_i
    end

    private
      def price_text
        @html.at("#smi-summary-items div").text[/\u20AC[0-9,]+/]
      end
  end
end
