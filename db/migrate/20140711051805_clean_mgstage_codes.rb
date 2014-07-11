class CleanMgstageCodes < ActiveRecord::Migration
  def change
    Product.all.each do |product|
      next unless product.code =~ /^\d+(\w+-\d+)$/
      if in_db = Product.search_in_db($1)
        in_db.register_alias(product.code)
        product.destroy!
        puts "#{product.code} => #{in_db.code}\tExists!"
      elsif in_db = Product.find_by(code: $1)
        in_db.register_alias(product.code, $1)
        product.destroy!
        puts "#{product.code} => #{in_db.code}\tRegistered!"
      else
        product.code = $1
        product.register_alias $1
        puts "#{$&} => #{$1}\tTransformed!"
      end
    end
  end
end
