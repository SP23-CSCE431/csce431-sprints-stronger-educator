class UploadController < ApplicationController
  before_action :set_s3_direct_post, only: [:new, :edit, :create, :update]
  def create
    uploaded_file = params[:csv_file]
    uploaded_image = params[:image_file]

    if uploaded_file.nil? && uploaded_image.nil?
      return redirect_to upload_index_path, notice: 'No file selected. Please try again.'
    end

    if uploaded_file.present?
      csv_file_path = Rails.root.join('public', 'uploads', uploaded_file.original_filename)
      File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
        file.write(uploaded_file.read)
      end

      # Create a new data import record
      @data_import = DataImport.new(
        csv_file_path: csv_file_path.to_s,
        campus_id: current_user.campus_id,
        district_id: current_user.district_id
      )
      if @data_import.save
        redirect_to upload_index_path, notice: 'Data imported!'
      else
        redirect_to upload_index_path, notice: 'Data import failed. Please try again.'
      end
    end

    if uploaded_image.present?
      image_path = Rails.root.join('public', 'uploads', uploaded_image.original_filename)
      File.open(Rails.root.join('public', 'uploads', uploaded_image.original_filename), 'wb') do |file|
        file.write(uploaded_image.read)
      end

      # Create a new data import record
      @data_import = DataImport.new(
        image_path: image_path.to_s,
        campus_id: params[:campus_id],
        district_id: params[:district_id]
      )
      if @data_import.save
        redirect_to upload_index_path, notice: 'Data imported!'
      else
        redirect_to upload_index_path, notice: 'Data import failed. Please try again.'
      end
    end
  end
end
