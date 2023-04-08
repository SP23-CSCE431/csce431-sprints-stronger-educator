class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts, id: :string do |t|
      t.string :name
      t.timestamps
    end

    add_index :districts, :id, unique: true
  end
end
