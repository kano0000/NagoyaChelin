class Admin::StoresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @stores = Store.page(params[:page]).order(created_at: :desc)
  end
  
  def show
    @store = Store.find(params[:id])
  end

  def destroy
    store = Store.find(params[:id])
    store.destroy
    redirect_to admin_stores_path
  end
end
