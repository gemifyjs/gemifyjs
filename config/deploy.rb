require 'bundler/capistrano'

set :application, "gemifyjs"
set :repository,  "git@github.com:gemifyjs/gemifyjs.git"

set :user, 'gemifyjs'
set :deploy_to, "/home/#{user}/#{application}"
set :use_sudo, false

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

default_run_options[:pty] = true

role :web, "96.8.123.99"                          # Your HTTP server, Apache/etc
role :app, "96.8.123.99"                          # This may be the same as your `Web` server
role :db,  "96.8.123.99", :primary => true # This is where Rails migrations will run

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
after "deploy:finalize_update", "config:github"
after "deploy:finalize_update", "config:rubygems"
after "deploy", "deploy:migrate"
after "deploy", "deploy:precompile_assets"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

namespace :config do
  task :github, :roles => :app do
    run "cp -f ~/github.yml #{release_path}/config/github.yml"
  end

  task :rubygems, :roles => :app do
    run "cp -f ~/rubygems.yml #{release_path}/config/rubygems.yml"
  end
end