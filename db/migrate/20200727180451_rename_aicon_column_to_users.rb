class RenameAiconColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :aicon, :icon
  end
end
