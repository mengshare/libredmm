class CreateAdminExceptions < ActiveRecord::Migration
  def change
    create_table :admin_exceptions do |t|
      t.string :uri
      t.string :message
      t.text :backtrace

      t.timestamps
    end
  end
end
