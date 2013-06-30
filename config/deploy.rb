set :application, "baytree"
set :deploy_to, "/vol/apps/#{application}"
set :repository, "git@github.com:netphase/#{application}.git"

set :user, "admin"
set :use_sudo, false

set :domain, "baytree.netphase.com"

server domain, :app, :web, :db, :primary => true

set :ssh_options, {
  :forward_agent => true,
  :compression => false,
  :paranoid => false,
  :username => user
}

set :scm, :git
set :repository_cache, "git_cache"
set :git_enable_submodules, true
set :deploy_via, :remote_cache

namespace :mod_rails do
  desc "Restart the application altering tmp/restart.txt for mod_rails."
    task :restart, :roles => :app do
      run "touch  #{release_path}/tmp/restart.txt"
    end
  end

namespace :deploy do
  %w(start restart).each { |name| task name, :roles => :app do mod_rails.restart end }
end

after :deploy, "mod_rails:restart"
