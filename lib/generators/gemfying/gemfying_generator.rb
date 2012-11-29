class GemfyingGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :file, :type => :string, :required => true

  def source_paths
    [File.expand_path('../templates', __FILE__), Dir.pwd]
  end

  def generate_layout
    # create necessary files
    target = File.join(Dir.pwd, "jems/#{file_name}-rails")
    template "engine.rb.erb", File.join(target, "lib/#{file_name}-rails/engine.rb")
    template "version.rb.erb", File.join(target, "lib/#{file_name}-rails/version.rb")
    template "railtie.rb.erb", File.join(target, "lib/#{file_name}-rails/railtie.rb")
    template "railsloader.rb.erb", File.join(target, "lib/#{file_name}-rails.rb")

    # copy provided javascript into this directory
    FileUtils.mkdir_p(File.join(target, 'vendor/assets/javascripts'))
    copy_file file, File.join(target, "vendor/assets/javascripts/#{file_name}.js")
  end

  private

  def file_name
    name.underscore
  end

  def name_constant
    name.capitalize
  end
end
