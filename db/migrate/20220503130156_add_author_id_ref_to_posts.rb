class AddAuthorIdRefToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author_id, null: false, foreign_key: true
    add_column :posts, :author_id, :integer
    add_index :posts, :author_id
    add_column :posts, :class_name, :string
    add_column :posts, :User, :string
  end
end
