class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :collection
      t.string :category
      t.string :image

      t.timestamps
    end
  end
end
