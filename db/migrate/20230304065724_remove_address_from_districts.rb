class RemoveAddressFromDistricts < ActiveRecord::Migration[7.0]
  def change
    remove_column :districts, :address, :string
  end
end
