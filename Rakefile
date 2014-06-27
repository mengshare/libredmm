# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :products do
  desc 'Refresh all products'
  task :refresh_all => :environment do
    failure_counter = 0
    success_counter = 0
    Product.all.each do |product|
      print "Refeshing #{product.code}... "
      result = product.refresh!
      result ? (success_counter += 1) : (failure_counter += 1)
      puts result ? "Success!" : "Failed!"
    end
    puts "All products refreshed. #{success_counter} succeeded. #{failure_counter} failed."
  end

  desc 'Refresh products matching regex'
  task :refresh, [:regex] => :environment do |t, args|
    regex = Regexp.new(args[:regex], Regexp::IGNORECASE)
    puts regex
    failure_counter = 0
    success_counter = 0
    Product.all.each do |product|
      next unless product.code =~ regex
      print "Refeshing #{product.code}... "
      result = product.refresh!
      result ? (success_counter += 1) : (failure_counter += 1)
      puts result ? "Success!" : "Failed!"
    end
    puts "All products refreshed. #{success_counter} succeeded. #{failure_counter} failed."
  end
end
