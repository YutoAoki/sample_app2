class AddOwnerToRelationships < ActiveRecord::Migration[5.1]
  def change
    add_column :relationships, :owner_id, :string
  end
end
