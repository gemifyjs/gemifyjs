class GemifyGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  # argument :file, :type => :string, :required => true

  def source_paths
    [File.expand_path('../templates', __FILE__), Dir.pwd]
  end

  def generate_layout
    # create necessary files
    target = File.join(Dir.pwd, "jems/#{jem.name}")
    template "engine.rb.erb", File.join(target, "lib/#{jem.name}/engine.rb")
    template "version.rb.erb", File.join(target, "lib/#{jem.name}/version.rb")
    template "railtie.rb.erb", File.join(target, "lib/#{jem.name}/railtie.rb")
    template "railsloader.rb.erb", File.join(target, "lib/#{jem.name}.rb")
    template "gemspec.rb.erb", File.join(target, "#{jem.name}.gemspec")

    # copy provided javascript into this directory
    # FileUtils.mkdir_p(File.join(target, 'vendor/assets/javascripts'))
    # copy_file file, File.join(target, "vendor/assets/javascripts/#{file_name}.js")
    repo = create_repo

    push_repo(repo, "jems/#{jem.name}")
  end

  def create_repo
    client = Octokit::Client.new(:login => ENV["GITHUB_EMAIL"], :password => ENV["GITHUB_PASSWORD"])
    client.create_repository("#{jem.name}")
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

  def name_for_class
    jem.name.capitalize
  end

  def jem
    Jem.find(name.to_i)
  end

end
