# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

namespace :products do
  desc 'Refresh all products'
  task :refresh_all => :environment do
    refresh_products
  end

  desc 'Refresh products matching regex'
  task :refresh, [:regexp] => :environment do |t, args|
    refresh_products Regexp.new(args[:regexp], Regexp::IGNORECASE)
  end

private
  def refresh_products(regexp = nil)
    total_counter = 0
    success_counter = 0
    Product.all.each do |product|
      next unless !regexp || product.code =~ regexp
      print "Refeshing #{product.code}... "
      total_counter += 1
      if product.refresh!
        success_counter += 1
        puts "Succeeded!"
      else
        puts "Failed!"
      end
    end
    puts "Job finished. Refreshed #{success_counter} out of #{total_counter} matched."
  end
end
