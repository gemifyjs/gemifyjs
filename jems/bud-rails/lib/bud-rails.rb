require "bud-rails/version"

module Bud
  module Rails
    if ::Rails.version < "3.1"
      require "bud-rails/railtie"
    else
      require "bud-rails/engine"
    end
  end
end