class CreateDataImports < ActiveRecord::Migration[7.0]
  def change
    create_table :data_imports, id: :integer do |t|
      t.binary :files, array: true, default: []
      t.binary :images, array: true, default: []
      t.references :campus, foreign_key: { to_table: :campuses, column: :id }
      t.references :district, foreign_key: { to_table: :districts, column: :id }
      t.timestamps
    end

    add_index :data_imports, :id, unique: true
  end
end
