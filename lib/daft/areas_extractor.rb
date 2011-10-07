module Daft
  class AreasExtractor
    def initialize(html)
      @html = html
    end

    def areas
      unless @areas
        @areas = @html.search("#a_id option").map do |option|
          AreaOption.new(option)
        end
      end
      @areas # array of names of areas in the select box
    end
  end

  class AreaOption
    attr_accessor :option_html
    def initialize(option_html)
      @option_html = option_html
    end

    def value
      @value ||= option_html[:value]
    end

    def name
      @name ||= option_html.text.gsub(/\(.+\)/, '').strip
    end

    def invalid?
      option_html.text =~ /^-/ || value.blank?
    end
  end
end
