set :application, 'tvarkarastis_api'
set :repo_url, ' git@bitbucket.org:simonas_sank/tvarkarastis_api.git'

set :deploy_to, '/home/deploy/tvarkarastis_api'
set :default_env, { path: "~/.rbenv/shims:~/.rbenv/bin:$PATH" }

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, 'deploy:restart'
  after :finishing, 'deploy:cleanup'
end