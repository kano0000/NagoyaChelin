class Public::UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    if params[:favorite]
      favorites = Favorite.where(user_id: @user.id).pluck(:store_id)
      @stores = Store.where(id: favorites).page(params[:page])
    else
      @stores = @user.stores.page(params[:page])
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "更新しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def withdraw
    @user = User.find(current_user.id)
    @user.update(is_active: false)
    reset_session
    redirect_to user_thanks_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
