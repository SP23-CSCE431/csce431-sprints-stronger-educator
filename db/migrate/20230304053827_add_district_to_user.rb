class AddDistrictToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :districts, null: false, foreign_key: true
  end
end
