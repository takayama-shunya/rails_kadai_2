class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.text :img
      t.text :content
      t.timestamps
    end
  end
end
