class ChangeUserToAuthorIdFromPosts < ActiveRecord::Migration[7.0]
  def change
    def up
        change_column :posts, author_id:string, class_name: 'User'
    end

    def down
        change_column :posts, users:string
    end
  end
end
