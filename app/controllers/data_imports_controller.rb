class DataImportsController < ApplicationController
  before_action :set_data_imports, only: %i[ show update destroy]

  def new
    @data_import = DataImport.new
  end

  def index
    @data_imports = DataImport.all
  end

  def create
    begin
      @campus = Campus.find_by(id: params[:data_import][:campus_id])
      @district = District.find_by(id: params[:data_import][:district_id])
      rescue ActiveRecord::RecordNotFound
      flash.now[:error] = "Invalid campus or district id"
      render 'data_import'
      return
    end
  
    # If both records exist, assign them to the user object
    if @campus && @district
      @data_import = DataImport.new
      @data_import.campus_id = @campus.id
      @data_import.district_id = @district.id
    else
      flash.now[:error] = "Invalid campus or district id"
      render 'data_import'
      return
    end

    csv_file = params[:data_import][:csv_file_path]
    image_file = params[:data_import][:image_path]

    @data_import.csv_file_path = save_file(csv_file) if csv_file.present?
    @data_import.image_path = save_file(image_file) if image_file.present?
    

    if @data_import.save!
      redirect_to "/data_imports/index", notice: 'Image was successfully uploaded.'
    else
      redirect_to "/data_imports/index", notice: 'Invalid information. Please try again'
    end
  end

  def update
    if @data_import.update(data_import_params)
      redirect_to @data_import, notice: "Data import was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /data_imports/1
  def destroy
    # Delete the file in /public/uploads that corresponds to the data import
    File.delete(@data_import.csv_file_path) if @data_import.csv_file_path.present?
    File.delete(@data_import.image_path) if @data_import.image_path.present?

    @data_import.destroy
    redirect_to "/data_imports/index", notice: "Data import was successfully destroyed."
  end

  def download_csv
    @data_import = DataImport.find(params[:id])
    send_file @data_import.csv_file_path, type: 'text/csv', disposition: 'attachment'
  end

  def download_image
    @data_import = DataImport.find(params[:id])
    send_file @data_import.image_path, type: 'image/png', disposition: 'attachment'
  end

  def download_all
    # download everything in the /public/uploads folder as a zip
    uploads_folder_path = Rails.root.join('public', 'uploads').to_s

    # Generate a unique filename for the zip file
    timestamp = Time.now.strftime('%Y-%m-%d_%H-%M-%S')
    zip_filename = "StrongerEd_#{timestamp}.zip"

    # Create the zip file in memory
    Zip::File.open(zip_filename, Zip::File::CREATE) do |zipfile|
      # Add each file in the uploads folder to the zip file
      Dir.glob(File.join(uploads_folder_path, '**', '*')).each do |file_path|
        zipfile.add(file_path.sub("#{uploads_folder_path}/", ''), file_path)
      end
    end

    # Send the zip file to the browser for download
    send_file(zip_filename, filename: zip_filename, type: 'application/zip')
  
    # destroy all records in data_imports table
    DataImport.destroy_all

    # clear the /public/uploads folder
    FileUtils.rm_rf(Dir.glob("#{uploads_folder_path}/*"))

    # delete the zip file
    File.delete(zip_filename)

    redirect_to "/data_imports/index", notice: "Downloaded all files"
  end

  private
  
  def set_data_imports
    @data_import = DataImport.find(params[:id])
  end

  # Only allow a list of trusted parameters through
  def data_import_params
    params.require(:data_import).permit(:campus_id, :district_id, :csv_file_path, :image_path)
  end
end