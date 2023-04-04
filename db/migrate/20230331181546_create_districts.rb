class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts, id: :integer do |t|
      t.string :name
      t.timestamps
    end

    add_index :districts, :id, unique: true
  end
end
