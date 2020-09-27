class CreateConversions < ActiveRecord::Migration[5.2]
  def change
    create_table :conversions do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamps
    end
    add_index :conversions, :sender_id
    add_index :conversions, :recipient_id
    add_index :conversions, [:sender_id, :recipient_id], unique: true
  end
end
