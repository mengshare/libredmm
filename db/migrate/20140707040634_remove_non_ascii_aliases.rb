class RemoveNonAsciiAliases < ActiveRecord::Migration
  def change
    Product.all.each do |p|
      old_value = p.aliases
      new_value = old_value.select do |a|
        a =~ /^[[:ascii:]]+$/
      end
      next if new_value == old_value
      puts old_value.to_s + " => " + new_value.to_s
      p.aliases = new_value
      p.aliases_will_change!
      p.save
    end
  end
end
