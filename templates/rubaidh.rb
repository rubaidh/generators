
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
plugin 'shoulda',      :git => 'git://github.com/thoughtbot/shoulda.git',       :submodule => true
plugin 'rspec',        :git => 'git://github.com/dchelimsky/rspec.git',         :submodule => true
plugin 'rspec-rails',  :git => 'git://github.com/dchelimsky/rspec-rails.git',   :submodule => true
plugin 'webrat',       :git => 'git://github.com/brynary/webrat.git',           :submodule => true
plugin 'object_daddy', :git => 'git://github.com/flogic/object_daddy.git',      :submodule => true
generate 'rspec'
generate 'cucumber'
git :add => '.'
git :commit => "-m 'Pull in submodules, and install support, for RSpec testing tools.'"

# Remave the existing Test::Unit test suite code.
git :rm => "-rf test"
run "rm -rf test"
git :commit => "-m 'Remove Test::Unit test suite.'"

# Create the databases and an emtpy db schema for VC.
rake "db:create:all"
rake "db:migrate"
git :add => "db/schema.rb"
git :commit => "-m 'Create a blank database schema.'"

# GetExceptional Notifier for notification of production errors
plugin 'exceptional', :git => 'git://github.com/contrast/exceptional.git', :submodule => true
file 'config/exceptional.yml', <<-EXCEPTIONAL
# here are the settings that are common to all environments
common: &default_settings
  # You must specify your Exceptional API key here.
  api-key: API_KEY_GOES_HERE
  # Exceptional creates a separate log file from your application's logs
  # available levels are debug, info, warn, error, fatal
  log-level: info
  # The exceptional agent sends data via regular http by default
  # Setting this value to true will send data over SSL, increasing security
  # There will be an additional CPU overhead in encrypting the data, however
  # as long as your deployment environment is not Passenger (mod_rails), this
  # happens in the background so as not to incur a page wait for your users.
  ssl: false

development:
  <<: *default_settings
  # Normally no reason to collect exceptions in development
  # NOTE: for trial purposes you may want to enable exceptional in development
  enabled: false

test:
  <<: *default_settings
  # No reason to collect exceptions when running tests by default
  enabled: false

production:
  <<: *default_settings
  enabled: true

staging:
  # It's common development practice to have a staging environment that closely
  # mirrors production, by default catch errors in this environment too.
  <<: *default_settings
  enabled: true

EXCEPTIONAL

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
