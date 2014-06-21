class DropAdminExceptions < ActiveRecord::Migration
  def change
    drop_table :admin_exceptions
  end
end
