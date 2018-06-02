class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @commented_restaurants = @user.restaurants.uniq

  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      if @user.update_attributes(user_params)
        flash[:notice] = "profile was successfully updated"
        redirect_to user_path(@user)
      else
        flash.now[:alert] = "profile was failed to update"
        render :action => :edit
      end
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :intro, :avatar)
  end

end
