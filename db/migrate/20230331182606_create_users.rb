class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :integer do |t|
      t.string :name
      t.string :email
      t.string :district_id
      t.string :campus_id
      t.timestamps
    end

    add_index :users, :id, unique: true
    add_foreign_key :users, :districts, column: :district_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :users, :campuses, column: :campus_id, primary_key: :id, on_delete: :cascade
  end
end
