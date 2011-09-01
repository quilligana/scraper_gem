class Fixture
  attr_accessor :extracted

  def initialize(fixture_name)
    @fixture_name = fixture_name
    @results = {}
    seed
  end

  def seed
    File.open(File.expand_path("fixtures/#{@fixture_name}.txt")) do |io|
      io.each_line do |line|
        split_line = line.split(' = ')
        @results[split_line[0].to_sym] = split_line[1].to_s.chomp
      end
    end
  end

  def method_missing(name, *args)
    string_name = name.to_s
    return super unless string_name =~ /^expected_\w+/
    requested_attribute = parsed_method_name string_name
    @results[requested_attribute.to_sym]
  end

  def parsed_method_name name
    name.gsub(/^expected_/, '')
  end

  # open the file containing the html of the fixture
  # parse this html with Nokogiri and return the parsed html
  def parse_html
    @path_to_fixture = File.expand_path("fixtures/#{@fixture_name}.html")
    begin
      fixture = File.open(@path_to_fixture)
      Nokogiri::HTML.parse(fixture)
    ensure
      fixture.close
    end
  end

  def extracted
    @extracted ||= DaftScraper::PageScraper.new(parse_html)
  end
end

