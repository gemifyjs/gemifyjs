require "console-rails/version"

module Console
  module Rails
    if ::Rails.version < "3.1"
      require "console-rails/railtie"
    else
      require "console-rails/engine"
    end
  end
end