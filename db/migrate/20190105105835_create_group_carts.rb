class CreateGroupCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :group_carts do |t|
      t.references :user, foreign_key: true
      t.string :token

      t.timestamps
    end
  end
end
