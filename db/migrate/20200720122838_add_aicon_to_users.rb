class AddAiconToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :aicon, :text
  end
end
