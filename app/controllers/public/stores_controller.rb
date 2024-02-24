class Public::StoresController < ApplicationController
  before_action :authenticate_user!

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user_id = current_user.id
    if @store.save
      flash[:notice] = "投稿しました"
      redirect_to stores_path
    else
      render :new
    end
  end

  def index
    @stores = Store.all
    respond_to do |format|
      format.html
      format.json { render 'index' }
    end
  end

  # def index
  #   respond_to do |format|
  #     format.html do
  #       @stores = Store.all
  #     end
  #     format.json do
  #       @stores = Store.all
  #     end
  #   end
  # end

  def show
    @store = Store.find(params[:id])
    @store_comment = StoreComment.new
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update
    @store = Store.find(params[:id])
    if @store.update(store_params)
      flash[:notice] = "更新しました"
      redirect_to stores_path
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

  def store_params
    params.require(:store).permit(:name, :description, :address, :food_image)
  end

end
