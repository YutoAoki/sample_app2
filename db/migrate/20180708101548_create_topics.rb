class CreateTopics < ActiveRecord::Migration[5.1]
  def change
    create_table :topics do |t|
      t.integer :user_id
      t.string :topic_search_id
      t.string :topic_name
      t.string :topic_image
      t.datetime :topic_meinichi
      t.string :topic_bio

      t.timestamps
    end
  end
end
