class MainController < ApplicationController
  def show
    @user = User.where(name: current_admin.full_name)
  end

  def is_admin?(user)
    return true if user.is_admin == true

    false
  end
end
