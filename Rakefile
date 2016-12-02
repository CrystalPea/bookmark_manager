require 'data_mapper'
require './app/app'

namespace :db do
  desc "Auto upgrades database"
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto upgrade complete (non-destructive)"
  end

  desc "Auto migrates database"
  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto upgrade complete (destructive)"
  end
end
