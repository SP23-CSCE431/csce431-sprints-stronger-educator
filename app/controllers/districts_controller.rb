class DistrictsController < ApplicationController
  def new
    @district = District.new
  end

  def create
    @district = District.new(district_params)
    if @district.save
      redirect_to "/districts/index", notice: 'District was successfully created.'
    else
      redirect_to "/districts/index", notice: 'Invalid information. Please try again'
    end
  end

  def district_params
    params.require(:district).permit(:id, :name)
  end

  def edit
    @district = District.find(params[:id])
    @district ||= District.new # Initialize @campus if it is not present
    render :edit, status: :ok
  end

  def update
    @district = District.find(params[:id])
    if @district.update(district_params)
      redirect_to "/districts/index", notice: 'District was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @district = District.find(params[:id])
    @district.destroy
    redirect_to "/districts/index", notice: 'District was successfully deleted.'
  end

  def show
    @district = District.find(params[:id])
  end

  def index
    @districts = District.all
  end
end
