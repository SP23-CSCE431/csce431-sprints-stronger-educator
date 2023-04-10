class DataImportsController < ApplicationController
  before_action :set_data_imports, only: %i[ show update destroy]

  def new
    @data_import = DataImport.new
  end
  # GET /data_imports
  def index
    @data_import = DataImport.all
    render json: @data_import
  end

  # GET /data_imports/l
  def show
    render json: @data_import.as_json(include: :images).merge(
      images: @data_import.image.map do |image|
        url_for(image)
      end
    )
  end

  # POST /data_imports
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
      @data_import = DataImport.new(data_import_params.except(:images))
      @data_import.campus_id = @campus.id
      @data_import.district_id = @district.id
    else
      flash.now[:error] = "Invalid campus or district id"
      render 'data_import'
      return
    end

    images = params[:data_import][:images]

    if images
      images.each do |image|
        @data_import.attach(image)
      end
    end

    if @data_import.save
      render json: @data_import, status: :created, location: @data_import
    else
      render json: @data_import.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data_imports/1
  def update
    if @data_import.update(data_import_params)
      render json: @data_import
    else
      render json: @data_import.errors, status: :unprocessable_entity
    end
  end

  # DELETE /data_imports/1
  def destroy
    @data_import.destroy
  end

  private
  
  def set_data_imports
    @data_import = DataImport.find(params[:id])
  end

  def index
    @data_imports = DataImport.all
  end

  # Only allow a list of trusted parameters through
  def data_import_params
    params.require(:data_import).permit(:files, :campus_id, :district_id, images: [])
  end
end