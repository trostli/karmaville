#!/usr/bin/env rake
# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Karmaville::Application.load_tasks

namespace :db do
  desc "Add the karma points of a user together"
  task :summate => :environment do
    User.all.each do |user|
      total = user.karma_points.sum(:value)
      user.update_attribute(:total_karma, total)
      if user.id % 15000 == 0
        puts "working on this rake thing still"
      end
    end
  end
end