module RubyGemService
  class << self
    def create_gem(gem_name, gem_file)
      `gem build #{gem_name}.gemspec`
      `gem push -k #{ENV["RUBYGEMS_API_KEY"]} #{gem_file}`
    end
  end
end