class RemoveUniqueIndexFromCampusId < ActiveRecord::Migration[7.0]
  def change
    #We are removing these foreign keys because there can be 
    #campuses of the same # if they are from different districts, therefore not unique in index
    remove_foreign_key :data_imports, column: :campus_id
    remove_foreign_key :users, column: :campus_id
    remove_index :campuses, :campus_id
    add_index :campuses, :campus_id, unique: false
    # add_foreign_key :data_imports, :campuses, column: :campus_id
    # add_foreign_key :users, :campuses, column: :campus_id


    # add_foreign_key :data_imports, :campuses, column: :campus_id, primary_key: :campus_id, on_delete: :cascade
    # add_foreign_key :users, :campuses, column: :campus_id, primary_key: :campus_id, on_delete: :cascade

  end
end
