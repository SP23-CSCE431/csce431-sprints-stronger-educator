class AddDistrictToCampus < ActiveRecord::Migration[7.0]
  def change
    add_reference :campuses, :districts, null: false, foreign_key: true
  end
end
