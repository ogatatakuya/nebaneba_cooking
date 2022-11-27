class Admin::CookingsController < ApplicationController
  
  def index
    @cookings = Cooking.page(params[:page]).per(15)
    #@cookings = current_member.cookings.all
    #@cooking = current_member.cookings.new
  end
  
  def show
    @cooking = Cooking.find(params[:id])
    @cooking_comments = @cooking.cooking_comments.order(created_at: :desc)
    #@cooking_comment = current_member.cooking_comments.new
  end
  
  def edit
    @cooking = Cooking.find(params[:id])
    @tags = Tag.all
  end
  
  def update
    @cooking = Cooking.find(params[:id])
    if @cooking.update(cooking_params)
      redirect_to admin_cookings_path
    else
      redirect_to edit_admin_cooking_path(cooking_id)
    end
  end
  
  def destroy
    @cooking = Cooking.find(params[:id])
    @cooking.destroy
    redirect_to admin_cookings_path
  end
  
  private
  def cooking_params
    params.require(:cooking).permit(:comment, :name, :image, :introduction, :tag_id, :member_id)
  end
end
