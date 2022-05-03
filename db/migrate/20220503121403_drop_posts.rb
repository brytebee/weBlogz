class DropPosts < ActiveRecord::Migration[7.0]
  def change
    drop_table :post
  end
end
