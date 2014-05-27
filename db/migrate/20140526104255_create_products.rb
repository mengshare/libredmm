class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.text :actresses
      t.text :actress_types
      t.string :brand
      t.string :code
      t.string :cover_image
      t.text :description
      t.text :directors
      t.text :genres
      t.string :label
      t.string :maker
      t.integer :movie_length
      t.string :page
      t.date :release_date
      t.text :sample_images
      t.text :scenes
      t.string :series
      t.string :title

      t.timestamps
    end
    add_index :products, :code
  end
end
