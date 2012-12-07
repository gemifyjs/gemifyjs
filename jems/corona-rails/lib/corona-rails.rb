require "corona-rails/version"

module Corona
  module Rails
    if ::Rails.version < "3.1"
      require "corona-rails/railtie"
    else
      require "corona-rails/engine"
    end
  end
end