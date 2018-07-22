class CreateRelationships < ActiveRecord::Migration[5.1]
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :topic_id
      t.integer :status

      t.timestamps
    end
    add_index :relationships, [:user_id, :topic_id], unique: true
  end
end
