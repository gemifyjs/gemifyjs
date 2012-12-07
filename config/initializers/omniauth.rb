Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, ENV["GITHUB_KEY_#{Rails.env.upcase}"], ENV["GITHUB_SECRET_#{Rails.env.upcase}"], scope: "user,repo"
end