class GemfyingGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  # argument :jem_name, :type => :string, :default => "none"
  # argument :opts, :type => :hash, :default => {}

  def generate_layout
    target = File.join(Dir.pwd, "jems/#{file_name}-rails")
    template "engine.rb.erb", File.join(target, "lib/#{file_name}-rails/engine.rb")
    template "version.rb.erb", File.join(target, "lib/#{file_name}-rails/version.rb")
    template "railtie.rb.erb", File.join(target, "lib/#{file_name}-rails/railtie.rb")

    # template "testing.html.erb", "#{file_name}-rails/testing.html.erb"
  end

  private

  def file_name
    name.underscore
  end

  def name_constant
    name.capitalize
  end
end
