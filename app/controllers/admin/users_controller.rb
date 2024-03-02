class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page]).order(created_at: :desc)
  end


  def show
    @user = User.find(params[:id])
    @stores = @user.stores.page(params[:page]).order(created_at: :desc)
  end

end
