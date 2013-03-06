#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TrelloEffortApp::Application.load_tasks

# loads the rake task from tracco gem
if Gem::Specification.respond_to?(:find_by_name)
  tracco_gem = Gem::Specification.find_by_name('tracco')
else
  tracco_gem = Gem.searcher.find('tracco')
end
Dir["#{tracco_gem.full_gem_path}/lib/tasks/tasks.rake"].each { |ext| load ext }
