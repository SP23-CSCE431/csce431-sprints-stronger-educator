class DistrictsController < ApplicationController
  def new
    @district = District.new
  end

  def district_params
    params.require(:district).permit(:id, :name, :district_id)
  end

  def create
    # Check if district already exists
    if District.exists?(id: @district.id)
      flash.now[:error] = "District with that id already exists. Please try again."
      render 'districts'
    # Check if the district object is valid
    elsif @district.valid?
      @district.save
      redirect_to root_path, notice: 'District was successfully created.'
    else
      flash.now[:error] = "Invalid information. Please try again."
      render 'districts'
    end

    def edit
      @district = District.find(params[:id])
      @district ||= District.new # Initialize @campus if it is not present
      render :edit, status: :ok
    end
  end

  def update
    @district = District.find(params[:id])
    if @district.update_attributes(district_params)
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
end
