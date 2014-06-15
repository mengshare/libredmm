class UpcaseProductCode < ActiveRecord::Migration
  def change
    Product.all.each do |product|
      product.code.upcase!
      product.save!
    end
  end
end
