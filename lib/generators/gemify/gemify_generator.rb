class GemifyGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  def source_paths
    logger.debug "source_paths"
    [File.expand_path('../templates', __FILE__), Dir.pwd]
  end

  def generate_files
    logger.debug "generate_files"
    # create necessary files
    target = File.join(Dir.pwd, "jems/#{jem.name}")
    template "engine.rb.erb", File.join(target, "lib/#{jem.name}/engine.rb")
    template "version.rb.erb", File.join(target, "lib/#{jem.name}/version.rb")
    template "railtie.rb.erb", File.join(target, "lib/#{jem.name}/railtie.rb")
    template "railsloader.rb.erb", File.join(target, "lib/#{jem.name}.rb")
    template "gemspec.rb.erb", File.join(target, "#{jem.name}.gemspec")
    template "README.md.tt", File.join(target, "README.md")

    logger.debug "create repo"
    repo = GithubService.create_repository(jem.name)
    logger.debug "add collab"
    GithubService.add_collaborator(repo.full_name, jem.creator.login)
    logger.debug "push repo"
    GithubService.push_local_repo("jems/#{jem.name}", repo.ssh_url)

    Dir.chdir(target) do
      version = "0.0.1"
      RubyGemService.create_gem(jem.name, "#{target}/#{jem.name}-#{version}.gem")
    end
  end

  private
  def name_for_class
    jem.base_name.capitalize
  end

  def jem
    Jem.find(name.to_i)
  end
end
