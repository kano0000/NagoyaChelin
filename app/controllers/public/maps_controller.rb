class Public::MapsController < ApplicationController
  def show
    @stores = Store.all
  end
end
