class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    @user ||= User.new # Initialize @user if it is not present
    render :edit, status: :ok
  end

  def user_params
    params.require(:user).permit(:user_id, :name, :email, :campus_id, :district_id)
  end
end
