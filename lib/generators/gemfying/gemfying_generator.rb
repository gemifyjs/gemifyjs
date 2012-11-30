class GemfyingGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  # argument :file, :type => :string, :required => true

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
    template "gemspec.rb.erb", File.join(target, "#{file_name}.gemspec")

    # copy provided javascript into this directory
    # FileUtils.mkdir_p(File.join(target, 'vendor/assets/javascripts'))
    # copy_file file, File.join(target, "vendor/assets/javascripts/#{file_name}.js")
    repo = create_repo

    push_repo(repo, "jems/#{file_name}-rails")
  end

  def create_repo
    client = Octokit::Client.new(:login => ENV["GITHUB_EMAIL"], :password => ENV["GITHUB_PASSWORD"])
    client.create_repository(file_name)
  end

  def push_repo(repo, directory_path)
    Dir.chdir(directory_path) do
      `git init`
      `git add .`
      `git commit -m "initial commit"`
      `git remote add origin #{repo.ssh_url.gsub("github.com", "gemify")}`
      `git push origin master`
    end
  end

  private

  def file_name
    name.underscore
  end

  def name_constant
    name.capitalize
  end
end
