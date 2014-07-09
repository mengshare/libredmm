class CleanupProductsGenres < ActiveRecord::Migration
  def change
    Product.all.each do |p|
      p.genres = p.genres
      p.genres_will_change!
      p.save
    end
  end
end
