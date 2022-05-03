class AddPostIdRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :post_id, null: false, foreign_key: true
    add_column :likes, :post_id, :integer
    add_index :likes, :post_id
  end
end
