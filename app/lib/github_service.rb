module GithubService
  @client = Octokit::Client.new(:login => ENV["GITHUB_EMAIL"], :password => ENV["GITHUB_PASSWORD"])
  class << self
    def push_local_repo(directory_path, url)
      Dir.chdir(directory_path) do
        `git init`
        `git add .`
        `git commit -m "initial commit"`
        `git remote add origin #{url.gsub("github.com", "gemify")}`
        `git push origin master`
      end
    end

    def method_missing(name, *args, &block)
      if @client.respond_to?(name)
        @client.send(name.to_sym, *args)
      else
        super
      end
    end
  end
end