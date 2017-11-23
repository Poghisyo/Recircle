class ProfilesController < ApplicationController


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    byebug
    unless user_params[:photo].nil?
      Cloudinary::Uploader.upload(user_params[:photo])
    end
    @user.update_attributes(user_params)
    redirect_to dashboard_path(active: "profile")
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :address, :first_name, :last_name, :age, :description, :company, :phone_number, :photo,)

  end

end
