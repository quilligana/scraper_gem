module Daft
  class AreasScraper < Scraper
    # it's very important that these stay in the same order as dafts county list
    COUNTIES = %w[Dublin Meath Kildare Wicklow Longford Offaly Westmeath Laois Louth Carlow Kilkenny Waterford
        Wexford Kerry Cork Clare Limerick Tipperary Galway Mayo Roscommon Sligo Leitrim Donegal Cavan
        Monaghan Antrim Armagh Tyrone Fermanagh Derry Down].freeze

    def initialize
      super()
      @agent.user_agent_alias = random_agent
    end

    def scrape_all_counties
      COUNTIES.each do |county_name|
        areas = scrape_county(county_name)
        yield(county_name, areas) if block_given?
      end
    end

    def scrape_county(county_name)
      url = url_for(county_name)
      AreasExtractor.new(@agent.get(url)).areas
    end

    def url_for(county_name)
        county_index = COUNTIES.find_index(county_name.titleize) + 1
        raise ArgumentError if county_index.nil?
        "http://www.daft.ie/searchsale.daft?search=1&s[cc_id]=c#{county_index}&s[route_id]=&s[a_id_transport]=0&s[address]=&s[txt]=&s[mnb]=&s[mxb]=&s[mnp]=&s[mxp]=&s[pt_id]=&s[house_type]=&s[sqmn]=&s[sqmx]=&s[mna]=&s[mxa]=&s[npt_id]=&s[days_old]=&s[new]=&s[agreed]=&s[search_type]=sale&s[transport]=&s[advanced]=&s[price_per_room]=&offset=0&limit=10"
    end
  end

end
