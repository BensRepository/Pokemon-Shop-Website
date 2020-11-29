class CreateProductToTrackers < ActiveRecord::Migration[5.2]
  def change
    create_table :product_to_trackers do |t|
      t.belongs_to :product, foreign_key: true
      t.belongs_to :tracker, foreign_key: true

      t.timestamps
    end
  end
end
