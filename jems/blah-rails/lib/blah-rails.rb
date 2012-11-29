require "blah-rails/version"

module Blah
  module Rails
    if ::Rails.version < "3.1"
      require "blah-rails/railtie"
    else
      require "blah-rails/engine"
    end
  end
end