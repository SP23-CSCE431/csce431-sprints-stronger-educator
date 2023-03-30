class RemoveAddressFromCampuses < ActiveRecord::Migration[7.0]
  def change
    remove_column :campuses, :address, :string
  end
end
