class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :comment, :message
  end
end
