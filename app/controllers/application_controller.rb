class ApplicationController < ActionController::Base
   before_action :authenticate_admin!

   rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
   end

   # user = User.create_with(name: admin.full_name, email: current_admin.email, district_id: 1, campus_id: 1)
end
