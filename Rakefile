# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :products do
  desc 'Refresh all products'
  task :refresh_all => :environment do
    Product.all.each do |product|
      print "Refeshing #{product.code}... "
      puts product.refresh! ? "Success!" : "Failed!"
    end
  end
end
