class RenameTypeToKeyInLogs < ActiveRecord::Migration
  def change
    rename_column :logs, :type, :key
  end
end
