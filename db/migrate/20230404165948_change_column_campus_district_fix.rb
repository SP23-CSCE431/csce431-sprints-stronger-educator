class ChangeColumnCampusDistrictFix < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :campuses, column: :district_id
    remove_foreign_key :data_imports, column: :district_id
    remove_foreign_key :data_imports, column: :campus_id
    remove_foreign_key :users, column: :district_id
    remove_foreign_key :users, column: :campus_id
    
    change_column :districts, :district_id, :string
    change_column :campuses, :district_id, :string
    change_column :campuses, :campus_id, :string
    change_column :data_imports, :campus_id, :string
    change_column :data_imports, :district_id, :string
    change_column :users, :campus_id, :string
    change_column :users, :district_id, :string

    add_index :districts, :district_id, unique: true
    add_index :campuses, :campus_id, unique: true

    add_foreign_key :campuses, :districts, column: :district_id, primary_key: :district_id, on_delete: :cascade
    add_foreign_key :data_imports, :districts, column: :district_id, primary_key: :district_id, on_delete: :cascade
    add_foreign_key :data_imports, :campuses, column: :campus_id, primary_key: :campus_id, on_delete: :cascade
    add_foreign_key :users, :districts, column: :district_id, primary_key: :district_id, on_delete: :cascade
    add_foreign_key :users, :campuses, column: :campus_id, primary_key: :campus_id, on_delete: :cascade
  end
end
