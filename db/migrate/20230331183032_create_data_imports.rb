class CreateDataImports < ActiveRecord::Migration[7.0]
  def change
    create_table :data_imports, id: :integer do |t|
      t.binary :files, array: true, default: []
      t.binary :images, array: true, default: []
      t.string :district_id
      t.string :campus_id
      t.timestamps
    end

    add_index :data_imports, :id, unique: true
    add_foreign_key :data_imports, :districts, column: :district_id, primary_key: :id, on_delete: :cascade
    add_foreign_key :data_imports, :campuses, column: :campus_id, primary_key: :id, on_delete: :cascade
  end
end
