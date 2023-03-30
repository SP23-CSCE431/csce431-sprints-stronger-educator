class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.string :address
      t.timestamps
    end
    add_index :users, :user_id, unique: true
  end
end
