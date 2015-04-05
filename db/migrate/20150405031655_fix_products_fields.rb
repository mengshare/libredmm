class FixProductsFields < ActiveRecord::Migration
  def change
    remove_column :products, :aliases, :string
    add_column :products, :tags, :string, array: true, default: '{}'
  end
end
