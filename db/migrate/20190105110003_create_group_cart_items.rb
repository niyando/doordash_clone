class CreateGroupCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :group_cart_items do |t|
      t.references :group_cart, foreign_key: true
      t.references :item, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :quantity, default: 0 
      t.timestamps
    end
  end
end
