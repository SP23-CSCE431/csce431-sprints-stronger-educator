class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :integer do |t|
      t.string :name
      t.string :email
      t.references :campus, foreign_key: { to_table: :campuses, column: :id }
      t.references :district, foreign_key: { to_table: :districts, column: :id }
      t.timestamps
    end

    add_index :users, :id, unique: true
  end
end
