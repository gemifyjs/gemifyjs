module RubyGemService
  class << self
    def create_gem(gem_name, gem_file)
      version = "0.0.1"
      `gem build #{gem_name}.gemspec`
      `gem push -k #{ENV["RUBYGEMS_API_KEY"]} #{gem_file}`
    end

    def test
      puts "test"
    end
  end
end