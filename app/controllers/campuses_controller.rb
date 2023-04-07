class CampusesController < ApplicationController
  def new
    @campus = Campus.new
  end

  def campus_params
    params.require(:campus).permit(:id, :name, :district_id)
  end

  def create
    # Find the district records with the given ids
    begin
      @district = District.find_by(id: params[:campus][:district_id])
    rescue ActiveRecord::RecordNotFound
      flash.now[:error] = "Invalid district id"
      render 'campuses'
      return
    end
    
    # Check if campus already exists
    if Campus.exists?(id: @campus.id)
      flash.now[:error] = "Campus with that id already exists. Please try again."
      render 'campuses'
    # Check if the campus object is valid
    elsif @campus.valid?
      @campus.save
      redirect_to root_path, notice: 'Campus was successfully created.'
    else
      flash.now[:error] = "Invalid information. Please try again."
      render 'campuses'
    end

    def edit
      @campus = Campus.find(params[:id])
      @campus ||= Campus.new
      render :edit, status: :ok
    end
  end

  def update
    @campus = Campus.find(params[:id])
    if @campus.update_attributes(campus_params)
      redirect_to root_path, notice: 'Campus was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @campus = Campus.find(params[:id])
    @campus.destroy
    redirect_to root_path, notice: 'Campus was successfully deleted.'
  end

  def show
    @campus = Campus.find(params[:id])
  end

  def find_by
    @campus = Campus.find_by(id: params[:id])
  end
end
