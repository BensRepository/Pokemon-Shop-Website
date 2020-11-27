class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.belongs_to :post, foreign_key: true, null: false
      t.string :comment, null: false

      t.timestamps
    end
  end
end
