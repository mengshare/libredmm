class AddScatologiesAndTranssexualitiesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :scatologies, :string, array: true, default: '{}'
    add_column :products, :transsexualities, :string, array: true, default: '{}'
  end
end
