class CreateProductReviews < ActiveRecord::Migration
  def change
    create_table :product_reviews do |t|
      t.belongs_to :product
      t.belongs_to :user
      t.integer :rating

      t.timestamps
    end
  end
end
