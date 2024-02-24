class Public::StoresController < ApplicationController
  before_action :authenticate_user!
  
  def hashtag
    @user = current_user
    if params[:name].nil?
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.stores.count}
    else
      @hashtag = Hashtag.find_by(hashname: params[:name])
      @stores = @hashtag.stores
      @hashtags = Hashtag.all.to_a.group_by{ |hashtag| hashtag.stores.count}
    end
  end
  
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
      puts @store.errors.full_messages
      render :new
    end
  end

  def index
    @stores = Store.all.order(created_at: :desc)
  end

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
    params.require(:store).permit(:name, :description, :address, :food_image, :hashbody, hashtag_ids: [])
  end

end
