class DistrictsController < ApplicationController
  def new
    @district = District.new
  end


  def create
    @district = District.new(district_params)
    @district_query = District.find_by(district_id: @district.district_id)

    # If district query is nil, create a new district object
    if @district_query == nil
      @district = District.new(district_params)
    else
      flash.now[:error] = "District with that id already exists. Please try again."
      render 'districts'
    end
    
    if @district.valid?
      @district.save
      redirect_to root_path, notice: 'District was successfully created.'
    else
      flash.now[:error] = "District id is: #{@district.id}. Invalid information. Please try again."
      render 'districts'
    end
  end

  def district_params
    params.require(:district).permit(:district_id, :name)
  end

  def edit
    @district = District.find(params[:id])
    @district ||= District.new # Initialize @campus if it is not present
    render :edit, status: :ok
  end

  def update
    @district = District.find(params[:id])
    if @district.update(district_params)
      redirect_to root_path, notice: 'District was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @district = District.find(params[:id])
    @district.destroy
    redirect_to root_path, notice: 'District was successfully deleted.'
  end

  def show
    @district = District.find(params[:id])
  end

  def find_by
    @district = district.find_by(id: params[:id])
  end

  def index
    @districts = District.all
  end
end
