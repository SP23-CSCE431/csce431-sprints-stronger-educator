class CreateCampuses < ActiveRecord::Migration[7.0]
  def change
    create_table :campuses, id: :integer do |t|
      t.string :name
      t.references :district, foreign_key: { to_table: :districts, column: :id }
      t.timestamps
    end

    add_index :campuses, :id, unique: true
  end
end
