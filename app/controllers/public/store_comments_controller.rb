class Public::StoreCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    store = Store.find(params[:store_id])
    comment = current_user.store_comments.new(store_comment_params)
    comment.store_id = store.id
    comment.save
    redirect_to request.referer
  end
  
  def destroy
    StoreComment.find(params[:id]).destroy
    redirect_to request.referer
  end
  
  private
  
  def store_comment_params
    params.require(:store_comment).permit(:comment)
  end
  
end
