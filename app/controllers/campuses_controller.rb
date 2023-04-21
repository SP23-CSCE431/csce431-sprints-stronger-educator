class CampusesController < ApplicationController
  def new
    @campus = Campus.new
  end

  def create
    @campus = Campus.new(campus_params)

    # check if district exists
    @district = District.find_by(id: params[:campus][:district_id])
    if @district.nil?
      redirect_to "/districts/index", notice: 'District not found. Please try again.'
      return
    end

    if @campus.save
      redirect_to "/districts/index", notice: 'Campus was successfully created.'
    else
      redirect_to "/districts/index", notice: 'Invalid information. Please try again.'
    end
  end

  def campus_params
    params.require(:campus).permit(:id, :name, :district_id)
  end

  def edit
    @campus = Campus.find(params[:id])
    @campus ||= Campus.new # Initialize @campus if it is not present
    render :edit, status: :ok
  end

  def update
    @campus = Campus.find(params[:id])

    # check if district exists
    @district = District.find_by(id: params[:campus][:district_id])
    if @district.nil?
      redirect_to "/districts/index", notice: 'District not found. Please try again.'
      return
    end

    if @campus.update(campus_params)
      redirect_to "/districts/index", notice: 'Campus was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @campus = Campus.find(params[:id])
    @campus.destroy
    redirect_to "/districts/index", notice: 'Campus was successfully deleted.'
  end

  def show
    @campus = Campus.find(params[:id])
  end

  def index
    @campuses = Campus.all
  end
end
