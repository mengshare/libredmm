class AddFieldsToProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :subtitle
      t.string :theme
      t.string :thumbnail_image
    end
    Product.destroy_all
  end
end
