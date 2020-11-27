class LinkUsersToComments < ActiveRecord::Migration[5.2]
  def up
    add_reference :comments, :user, index: true
    Comment.reset_column_information
    user = User.first

    Comment.all.each do |note|
      note.user_id = user.id
      note.save!
    end

    change_column_null :comments, :user_id, false
    add_foreign_key :comments, :users
  end

  def down
  remove_foreign_key :comments, :users
  remove_reference :comments, :user, index: true
  end
end
