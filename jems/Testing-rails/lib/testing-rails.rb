require "testing/version"

module Testing
  module Rails
    if ::Rails.version < "3.1"
      require "Testing/railtie"
    else
      require "Testing/engine"
    end
  end
end