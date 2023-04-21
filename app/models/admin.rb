class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  def self.from_google(auth)
    validates :email, presence: true
    # return nil unless email =~ /@gmail.com || @tamu.edu\z/
    create_with(uid: auth.uid, full_name: auth.info.name, avatar_url: auth.info.image).find_or_create_by!(email: auth.info.email)
  end
end
