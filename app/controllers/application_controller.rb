class ApplicationController < ActionController::Base
  before_action :authenticate_admin!

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def current_user
    @current_user ||= User.find_by(email: current_admin.email)
  end

  helper_method :current_user

  def campus_find_by(id)
    @campus = Campus.find_by(id: id)
  end

  helper_method :campus_find_by

  def district_find_by(id)
    @district = District.find_by(id: id)
  end

  helper_method :district_find_by
end