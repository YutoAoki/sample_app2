class AddOwnerIdToRelationships < ActiveRecord::Migration[5.1]
  def change
    add_column :relationships, :owner_id, :integer
  end
end
