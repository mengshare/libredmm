class AddIndexesToProducts < ActiveRecord::Migration
  def change
    add_index :products, :actresses, using: 'gin'
    add_index :products, :aliases, using: 'gin'
    add_index :products, :maker
  end
end
