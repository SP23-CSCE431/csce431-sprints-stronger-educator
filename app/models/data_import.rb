class DataImport < ApplicationRecord
  self.table_name = "data_imports"

  private

  def data_import_params
    params.require(:data_import).permit(:files, :campus_id, :district_id, images: [])
  end

  def save_file(file)
    return unless file.present?

    file_name = "#{SecureRandom.hex}-#{file.original_filename}"
    file_path = Rails.root.join('public', 'uploads', file_name)

    File.open(file_path, 'wb') do |f|
      f.write(file.read)
    end

    "/uploads/#{file_name}"
  end
end
