class CreateActressesProducts < ActiveRecord::Migration
  def change
    create_table :actresses_products, id: false do |t|
      t.belongs_to :actress
      t.belongs_to :product
    end
  end
end
