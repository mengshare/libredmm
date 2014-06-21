class AddAliasesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :aliases, :string, array: true, default: '{}'
  end
end
