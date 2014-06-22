class UniqAndUpcaseAliases < ActiveRecord::Migration
  def change
    Product.all.each do |p|
      p.aliases = p.aliases.map(&:upcase).uniq
      p.aliases_will_change!
      p.save!
    end
  end
end
