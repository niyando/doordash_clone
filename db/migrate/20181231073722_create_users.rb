class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email, unique: true, index: true
      t.string :password_digest
      t.string :auth_token, unique: true, index: true

      t.timestamps
    end
  end
end
