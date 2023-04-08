class CreateCampuses < ActiveRecord::Migration[7.0]
  def change
    create_table :campuses, id: :string do |t|
      t.string :name
      t.string :district_id
      t.timestamps
    end

    add_index :campuses, :id, unique: true
    add_foreign_key :campuses, :districts, column: :district_id, primary_key: :id, on_delete: :cascade
  end
end
