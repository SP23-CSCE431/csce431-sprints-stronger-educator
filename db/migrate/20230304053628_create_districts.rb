class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts do |t|
      t.uuid :district_id, default: 'uuid_generate_v4()', null: false
      t.string :name
      t.string :address
      t.timestamps
    end
    add_index :districts, :district_id, unique: true
  end
end
