class CleanupActressesField < ActiveRecord::Migration
  def change
    Product.all.each do |p|
      old_value = p.actresses
      new_value = old_value.map do |a|
        a.remove(/[\s\.]/)
      end.reject do |a|
        a == '/'
      end.sort if old_value
      next if new_value == old_value
      puts old_value.to_s + " => " + new_value.to_s
      p.actresses = new_value
      p.actresses_will_change!
      p.save
    end
  end
end
