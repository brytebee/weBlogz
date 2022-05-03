class AddAuthorIdRefToLikes < ActiveRecord::Migration[7.0]
  def change
    add_reference :likes, :author_id, null: false, foreign_key: true
    add_column :likes, :author_id, :integer
    add_index :likes, :author_id
    add_column :likes, :User, :string
  end
end
