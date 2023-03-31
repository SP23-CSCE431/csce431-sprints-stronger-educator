class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:user_id, :name, :email, :campus_id, :district_id)
  end

  def create
    # Find the campus and district records with the given ids
    begin
      @campus = Campus.find_by(id: params[:user][:campus_id])
      @district = District.find_by(id: params[:user][:district_id])
    rescue ActiveRecord::RecordNotFound
      flash.now[:error] = "Invalid campus or district id"
      render 'users'
      return
    end
  
    # If both records exist, assign them to the user object
    if @campus && @district
      @user = User.new(user_params)
      @user.campus_id = @campus.id
      @user.district_id = @district.id
    else
      flash.now[:error] = "Invalid campus or district id"
      render 'users'
      return
    end
    
    # Check if user already exists
    if User.exists?(email: @user.email)
      flash.now[:error] = "User with that email already exists. Please try again."
      render 'users'
    # Check if the user object is valid
    elsif @user.valid?
      @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      flash.now[:error] = "Invalid information. Please try again."
      render 'users'
    end

    def edit
      @user = User.find(params[:id])
      @user ||= User.new # Initialize @user if it is not present
      render :edit, status: :ok
    end


  end
end
