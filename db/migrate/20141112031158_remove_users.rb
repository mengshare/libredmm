class RemoveUsers < ActiveRecord::Migration
  def change
    drop_table :users
    drop_table :product_reviews
  end
end
