class RemoveActressesFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :actresses, :string
  end
end
