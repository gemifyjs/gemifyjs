module GithubService
  class << self
    def create_remote_repo(name)
      client = Octokit::Client.new(:login => ENV["GITHUB_EMAIL"], :password => ENV["GITHUB_PASSWORD"])
      client.create_repository(name)
    end

    def push_local_repo(directory_path, url)
      Dir.chdir(directory_path) do
        `git init`
        `git add .`
        `git commit -m "initial commit"`
        `git remote add origin #{url.gsub("github.com", "gemify")}`
        `git push origin master`
      end
    end
  end
end