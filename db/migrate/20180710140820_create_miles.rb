class CreateMiles < ActiveRecord::Migration[5.1]
  def change
    create_table :miles do |t|
      t.integer :user_id
      t.integer :topic_id

      t.timestamps
    end
  end
end
