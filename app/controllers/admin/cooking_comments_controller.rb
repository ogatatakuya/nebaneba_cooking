class Admin::CookingCommentsController < ApplicationController
  before_action :set_cooking
  
  def index
    
  end
  
  
  
  def destroy
    @cooking_comment = CookingComment.find(params[:id])
    @cooking_comment.destroy
    #CookingComment.find(params[:id]).destroy
    redirect_to admin_cooking_path(@cooking)
  end
  
  def set_cooking
    @cooking = Cooking.find(params[:cooking_id])
  end
  
  def cooking_comment_params
    params.require(:cooking_comment).permit(:comment).merge(member_id: current_member.id, cooking_id: params[:cooking_id])
  end

  
end
