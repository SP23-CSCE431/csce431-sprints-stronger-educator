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

    validates :name, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :campus_id, presence: true
    validates :district_id, presence: true

    private

    def user_params
        params.require(:user).permit(:user_id, :name, :email, :campus_id, :district_id)
    end

    def admin?
      is_admin = true
    end
end
