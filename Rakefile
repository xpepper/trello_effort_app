#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TrelloEffortApp::Application.load_tasks

# loads the rake task from trello_effort_tracker gem
Dir["#{Gem.searcher.find('trello_effort_tracker').full_gem_path}/lib/tasks/tasks.rake"].each { |ext| load ext }
