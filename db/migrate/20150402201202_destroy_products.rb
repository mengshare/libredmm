class DestroyProducts < ActiveRecord::Migration
  def change
    Product.destroy_all
  end
end
