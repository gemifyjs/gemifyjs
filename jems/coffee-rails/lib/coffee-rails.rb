require "coffee-rails/version"

module Coffee
  module Rails
    if ::Rails.version < "3.1"
      require "coffee-rails/railtie"
    else
      require "coffee-rails/engine"
    end
  end
end