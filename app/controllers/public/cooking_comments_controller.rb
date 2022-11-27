class Public::CookingCommentsController < ApplicationController
  before_action :set_cooking
  before_action :authenticate_member!

  def index
    
  end
  
  def create
    @cooking_comment = @cooking.cooking_comments.create(cooking_comment_params)
    if @cooking_comment.save
      redirect_to cooking_path(@cooking)
    else
      flash.now[:alert] = 'コメントに失敗しました'
      redirect_to cooking_path(@cooking)
    end
  end
  
  def destroy
    @cooking_comment = CookingComment.find(params[:id])
    @cooking_comment.destroy
    redirect_to cooking_path(@cooking)
  end

  private
  
  def set_cooking
    @cooking = Cooking.find(params[:cooking_id])
  end
  
  def cooking_comment_params
    params.require(:cooking_comment).permit(:comment).merge(member_id: current_member.id, cooking_id: params[:cooking_id])
  end
end
