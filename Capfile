# Load DSL and Setup Up Stages
require 'capistrano/setup'
require 'capistrano/deploy'

require 'capistrano/rails'
require 'capistrano/bundler'
require 'capistrano/rbenv'
require 'capistrano/puma'

require 'capistrano/bundler'
require 'capistrano/rails'

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.4.2'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }