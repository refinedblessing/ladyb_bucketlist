class CreateBucketlists < ActiveRecord::Migration
  def change
    create_table :bucketlists do |t|
      t.string :name
      t.string :created_by

      t.timestamps null: false
    end
    add_index :bucketlists, :created_by
  end
end
