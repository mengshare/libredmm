class CreateActresses < ActiveRecord::Migration
  def change
    create_table :actresses do |t|
      t.string :name

      t.timestamps
    end
    add_index :actresses, :name
  end
end
