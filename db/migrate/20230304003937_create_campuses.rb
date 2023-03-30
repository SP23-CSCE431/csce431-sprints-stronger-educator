class CreateCampuses < ActiveRecord::Migration[7.0]
  def change
    create_table :campuses do |t|
      t.uuid :campus_id, default: 'uuid_generate_v4()', null: false
      t.string :name
      t.string :address
      t.timestamps
    end
    add_index :campuses, :campus_id, unique: true
  end
end
