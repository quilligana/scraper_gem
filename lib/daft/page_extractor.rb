module Daft
  class Photo
    def initialize(noko_xml_el)
      @photo = noko_xml_el
    end

    def src
      @src ||= @photo.attr("src")
    end

    def width
      @width ||= @photo.attr("width")
    end

    def height
      @height ||= @photo.attr("height")
    end
  end

  class PageExtractor
    def initialize(html)
      @html = html
    end

    def market
      unless @market
        text = @html.at('#breadcrumbs a:nth-child(2)').text
        @market = text.gsub(/search /, '')
      end
      @market
    end

    def rent_period
      return false unless market == 'rental'
    end

    def photos
      unless @photos
        @photos = []
        @html.search("div#pb_carousel li img").each do |img|
          @photos << Photo.new(img)
        end
      end
      @photos
    end

    def agent_name
      @agent_name ||= @html.at(".first_ba_li h2").text
    end

    def agent_phone
      @agent_phone ||= @html.at("#phone_adv strong").text
    end

    def price
      @price ||= price_text.gsub(/\D/, '').to_i
    end

    def property_type
      @property_type ||= @html.at("#smi-summary-items :nth-child(2)").text
    end

    def bedrooms
      @bedrooms ||= @html.at("#smi-summary-items :nth-child(4)").text[/\d/].to_i
    end

    def bathrooms
      @bathrooms ||= @html.at("#smi-summary-items :nth-child(6)").text[/\d/].to_i
    end

    def address
      @address ||= @html.at("#address_box h2").text
    end

    def daft_id
      @daft_id ||= saved_add_link_href.match(/id=\d+/)[0].gsub(/\D/, '').to_i
    end

    private
      def price_text
        @price_text ||= @html.at("#smi-summary-items div").text[/\u20AC[0-9,]+/]
      end

      def saved_add_link_href
        @html.at("#saved-ad a").attr("href")
      end
  end
end
