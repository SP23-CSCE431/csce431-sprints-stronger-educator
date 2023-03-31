class AddCampusToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :campus, null: false, foreign_key: true
  end
end
