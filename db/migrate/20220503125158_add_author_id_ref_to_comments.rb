class AddAuthorIdRefToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :author_id, null: false, foreign_key: true
    add_column :comments, :author_id, :integer
    add_index :comments, :author_id
  end
end
