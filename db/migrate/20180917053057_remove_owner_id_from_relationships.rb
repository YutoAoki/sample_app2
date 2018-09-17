class RemoveOwnerIdFromRelationships < ActiveRecord::Migration[5.1]
  def change
    remove_column :relationships, :owner_id, :string
  end
end
