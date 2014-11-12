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

  desc 'Explore the world!'
  task :explore => :environment do
    series = Hash.new
    Product.all.each do |product|
      if product.code =~ /^(\w+)-(\d+)/
        series[$1] = $2.length unless series[$1] && series[$1] < $2.length
      end
    end
    found_count = 0
    series.sort.each do |alpha, min_len|
      puts "Trying #{alpha}-" + "x" * min_len
      99999.times do |i|
        digit = (i + 1).to_s.rjust(min_len, '0')
        code = "#{alpha}-#{digit}"
        next if Product.search_in_db(code)
        break unless Product.search(code)
        puts "> Found #{code}"
        found_count += 1
      end
    end
    puts "Found #{found_count} in total"
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
