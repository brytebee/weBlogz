class AddPostIdRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :post_id, null: false, foreign_key: true
    add_column :comments, :post_id, :integer
    add_index :comments, :post_id
  end
end
