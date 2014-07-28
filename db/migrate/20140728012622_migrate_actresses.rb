class MigrateActresses < ActiveRecord::Migration
  def change
    Product.find_each do |product|
      product.read_attribute(:actresses).each do |name|
        actress = Actress.find_or_create_by(name: name)
        product.actresses << actress
      end
      product.save
    end
  end
end
