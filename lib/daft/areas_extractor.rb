module Daft
  class AreasExtractor
    attr_reader :html
    def initialize(html)
      @html = html
    end

    def areas
      @areas ||= options.map{|option| AreaOption.new(option) }.delete_if {|a| a.invalid? }
    end

    def options
      @options ||= html.search("#a_id option")
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
      option_html.text =~ /^-/ || value == ""
    end
  end
end
