class User < ApplicationRecord
    self.table_name = "users"

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end

    private

    def user_params
        params.require(:user).permit(:user_id, :name, :email, :campus_id, :district_id)
    end
end
