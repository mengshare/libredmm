class MigrateActresses < ActiveRecord::Migration
  def change
    Product.find_each do |product|
      print product.code + ':'
      product.read_attribute(:actresses).each do |name|
        print ' ' + name
        actress = Actress.find_or_create_by(name: name)
        product.actresses << actress
      end
      product.save
      puts ''
    end
  end
end
