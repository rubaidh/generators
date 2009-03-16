
git :init

# Have git ignore a pile of useless things.
file ".gitignore", <<-GITIGNORE
# Log files
/log/*.log

# Temporary files
/tmp

# Generated documentation
/doc/api
/doc/app
/doc/plugins

# RSpec test coverage
/coverage

# Pesky .DS_Store files from Mac OS X
.DS_Store

GITIGNORE

# Don't delete the log folder, thanks, git.
file "log/.keep", ""

git :add => '.'
git :commit =>  "-m 'Initial commit of application skeleton.'"

# Pull Rails in as a submodule
git :submodule => 'add git://github.com/rails/rails.git vendor/rails'
git :commit => '-m "Pull in Rails as a git submodule."'

# Update against the latest edge Rails
rake 'rails:update'
git :add => '.'
git :commit => '-m "Update Rails skeleton code to latest from edge Rails."'

# Pull in all our favourite testing tools.
plugin 'remarkable',   :git => 'git://github.com/carlosbrando/remarkable.git',  :submodule => true
plugin 'rspec',        :git => 'git://github.com/dchelimsky/rspec.git',         :submodule => true
plugin 'rspec-rails',  :git => 'git://github.com/dchelimsky/rspec-rails.git',   :submodule => true
plugin 'webrat',       :git => 'git://github.com/brynary/webrat.git',           :submodule => true
plugin 'cucumber',     :git => 'git://github.com/aslakhellesoy/cucumber.git',   :submodule => true
plugin 'object_daddy', :git => 'git://github.com/flogic/object_daddy.git',      :submodule => true
generate 'rspec'
generate 'cucumber'
git :add => '.'
git :commit => "-m 'Pull in submodules, and install support, for RSpec/Cucumber testing tools.'"

# Remave the existing Test::Unit test suite code.
git :rm => "-rf test"
run "rm -rf test"
git :commit => "-m 'Remove Test::Unit test suite.'"

# Create the databases and an emtpy db schema for VC.
rake "db:create:all"
rake "db:migrate"
git :add => "db/schema.rb"
git :commit => "-m 'Create a blank database schema.'"

# Hoptoad Notifier for notification of production errors
plugin 'hoptoad_notifier', :git => 'git://github.com/thoughtbot/hoptoad_notifier.git', :submodule => true
file 'app/controllers/application_controller.rb', <<-RUBY
class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  filter_parameter_logging :password

  include HoptoadNotifier::Catcher
end
RUBY

initializer 'hoptoad.rb', <<-RUBY
HoptoadNotifier.configure do |config|
  # FIXME Insert Hoptoad API key.
  config.api_key = 'Insert API Key here'
end
RUBY

git :add => '.'
git :commit => "-m 'Incorporate Hoptoad exception notification support.'"

# Capistrano-ification
capify!
git :add => '.'
git :commit => "-m 'Capistrano configuration.'"

# Tidy up the public folder
git :rm => "public/index.html public/robots.txt public/favicon.ico public/images/rails.png"
git :commit => " -m 'Remove static files we will not need.'"

# And I think that'll do for now. What, you want me to automate the writing of
# the app too?! :-)
