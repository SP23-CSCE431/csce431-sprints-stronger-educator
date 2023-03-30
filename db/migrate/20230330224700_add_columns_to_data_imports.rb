class AddColumnsToDataImports < ActiveRecord::Migration[7.0]
  def change
    add_column :data_imports, :files, "bytea[]"
    add_column :data_imports, :images, "bytea[]"
  end
end
