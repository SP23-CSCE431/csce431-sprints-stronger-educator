class ChangeDataImportsColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :data_imports, :csv_file_path, :string
    add_column :data_imports, :image_path, :string

    remove_column :data_imports, :files
    remove_column :data_imports, :images
  end
end
