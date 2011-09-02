module DaftScraper
  class PageExtractor
    def initialize(html)
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

    def address
      @html.at("#address_box h2").text
    end

    def daft_id
      saved_add_link_href.match(/id=\d+/)[0].gsub(/\D/, '').to_i
    end

    private
      def price_text
        @html.at("#smi-summary-items div").text[/\u20AC[0-9,]+/]
      end

      def saved_add_link_href
        @html.at("#saved-ad a").attr("href")
      end
  end
end
