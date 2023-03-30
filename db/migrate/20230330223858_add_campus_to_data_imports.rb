class AddCampusToDataImports < ActiveRecord::Migration[7.0]
  def change
    add_reference :data_imports, :campuses, foreign_key: true
  end
end
