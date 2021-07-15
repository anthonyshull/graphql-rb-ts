class CreatePurchases < ActiveRecord::Migration[6.1]
  def change
    create_table :purchases do |t|
      t.integer :buyer_id, null: false
      t.references :product, null: false
      t.integer :seller_id, null: false
      t.float :price, null: false

      t.timestamps
    end
  end
end
