class AddBoobsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :boobs, :string
  end
end
