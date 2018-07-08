class CreateGraves < ActiveRecord::Migration[5.1]
  def change
    create_table :graves do |t|
      t.string :grave_search_id
      t.string :grave_name
      t.string :grave_image
      t.datetime :meinichi
      t.string :religion
      t.string :string
      t.string :grave_comment
      t.integer :user_id

      t.timestamps
    end
  end
end
