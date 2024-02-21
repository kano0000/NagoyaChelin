class Public::StoresController < ApplicationController
  before_action :authenticate_user!

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.new(shop_params)
    if @shop.save
      flash[:notice] = "投稿しました"
      redirect_to shops_path
    else
      render :new
    end
  end

  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])
    if @shop.update(shop_params)
      flash[:notice] = "更新しました"
      redirect_to shops_path
    else
      render :edit
    end
  end

  def destroy
    shop = Shop.find(params[:id])
    shop.destroy
    redirect_to shops_path
  end

  private

  def shop_params
    params.require(:store).permit(:name, :description, :address, :store_image)
  end

end
