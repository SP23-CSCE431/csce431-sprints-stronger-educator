class MainController < ApplicationController
  def show
    @user = User.where(:name => current_admin.full_name)
  end

  def is_admin?(user)
    if user.is_admin == true
      return true
    else
      return false
    end
  end
end
