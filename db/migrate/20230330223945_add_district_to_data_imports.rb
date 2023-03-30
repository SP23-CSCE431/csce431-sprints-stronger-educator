class AddDistrictToDataImports < ActiveRecord::Migration[7.0]
  def change
    add_reference :data_imports, :districts, foreign_key: true
  end
end
