require "rspec/expectations"
RSpec::Matchers.define :include_area do |expected|
  match do |areas|
    areas.detect {|a| a.name == expected }
  end

  failure_message_for_should_not do |areas|
    "expected areas to not contain '#{expected}'"
  end

  failure_message_for_should do |areas|
    "expected areas to contain '#{expected}'"
  end

end
