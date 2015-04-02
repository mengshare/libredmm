class RemoveActresses < ActiveRecord::Migration
  def change
    drop_table :actresses
    add_column :products, :actresses, :string, array: true, default: '{}'
  end
end
