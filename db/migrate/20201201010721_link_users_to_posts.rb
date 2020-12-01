class LinkUsersToPosts < ActiveRecord::Migration[5.2]
  def up
    add_reference :posts, :user, index: true
    Post.reset_column_information
    user = User.first

  Post.all.each do |post|
    post.user_id = user.id
    post.save!
  end

    change_column_null :posts, :user_id, false
    add_foreign_key :posts, :users
  end

  def down
    remove_foreign_key :posts, :users
    remove_reference :posts, :user, index: true
  end
end
