class Public::MapsController < ApplicationController
  
  def show
    @stores = Store.all
  end
  
  def search
    @stores = Store.search(params[:keyword])
    @keyword = params[:keyword]
    render "show"
  end
end
