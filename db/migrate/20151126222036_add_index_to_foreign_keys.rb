class AddIndexToForeignKeys < ActiveRecord::Migration
  def change
    add_index :items, :bucketlist_id
  end
end
