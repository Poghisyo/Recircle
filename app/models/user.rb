class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Following line makes your model google-omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook]

  has_many :materials
  has_many :purchases


  def self.find_for_google_oauth2(oauth, signed_in_resource=nil)
    credentials = oauth.credentials
    data = oauth.info
    user = User.where(email: data["email"]).first


    # Uncomment the section below if you want users to be created if they don't exist
    byebug
    unless user
    user = User.create(
      first_name: data["first_name"],
      last_name: data["first_name"],
      photo: data["image"],
      email: data["email"],
      password: Devise.friendly_token[0,20],
      token: credentials.token,
      # refresh_token: credentials.refresh_token
     )
    end

    user
  end
end
