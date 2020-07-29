ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

namespace :test do
    desc "Test Task"
    
     desc "Load stuff in IRB."
     task :console do
    
       exec "irb -r rubygems -r sanitize" #require multiple gems by typing -r gemname
     end
end

# Type `rake -T` on your command line to see the available rake tasks.