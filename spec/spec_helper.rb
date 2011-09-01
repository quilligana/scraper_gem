require File.expand_path("lib/daft_scraper")

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")
ActiveRecord::Schema.define(:version => 1) do
  create_table :listings do |t|
    t.string :address
  end
end

class Listing < ActiveRecord::Base
  attr_accessible :address
end

RSpec.configure do |config|
  # some (optional) config here
end
