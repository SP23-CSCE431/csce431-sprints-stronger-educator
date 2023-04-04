class ChangeIntToStringFromCampusesAndDistricts < ActiveRecord::Migration[7.0]
  def up
    change_column :districts, :district_id, :string
    change_column :campuses, :district_id, :string
    change_column :campuses, :campus_id, :string
  end

  def down
    change_column :districts, :district_id, :integer
    change_column :campuses, :district_id, :bigint
    change_column :campuses, :campus_id, :integer
  end
end
