class MakeProductsCodeUnique < ActiveRecord::Migration
  def change
    remove_index :products, :code
    add_index :products, :code, unique: true
  end
end
