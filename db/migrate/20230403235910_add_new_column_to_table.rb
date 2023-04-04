class AddNewColumnToTable < ActiveRecord::Migration[7.0]
  def change
    add_column :districts, :district_id, :integer
    add_column :campuses, :campus_id, :integer
  end
end
