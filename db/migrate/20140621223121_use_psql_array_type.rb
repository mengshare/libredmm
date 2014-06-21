class UsePsqlArrayType < ActiveRecord::Migration
  def change
    Product.destroy_all
    %i(actresses actress_types categories directors genres sample_images scenes).each do |column|
      remove_column :products, column
      add_column :products, column, :string, array: true, default: '{}'
    end
  end
end
