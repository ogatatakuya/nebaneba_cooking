class Public::CookingDetailsController < ApplicationController
  def new
    
    @cooking = Cooking.find(params[:cooking_id])
    @cooking_detail = @cooking.cooking_details.new
    @cooking_detail.member_id = current_member.id
    @detail_id = params[:cooking_id]
  end

  def create
    @cooking = Cooking.find(params[:cooking_id])
    @cooking_detail = @cooking.cooking_details.new(cooking_detail_params)
    @cooking_detail.member_id = current_member.id
    if @cooking_detail.save
      redirect_to cooking_path(@cooking_detail.cooking_id)
    else
      redirect_to new_cooking_cooking_detail_path
    end
  end

  def edit
     @cooking_detail = CookingDetail.find(params[:id])
  end

  def update
     @cooking_detail = CookingDetail.find(params[:id])
    if @cooking_detail.update(cooking_detail_params)
      redirect_to cooking_path(@cooking_detail.cooking_id)
    else
      redirect_to edit_cooking_cooking_detail_path(@cooking_detail.id)
    end
  end

  def destroy
     @cooking_detail = CookingDetail.find(params[:id])
     @cooking_detail.destroy
      redirect_to cooking_path(@cooking_detail.cooking_id)
  end
  
  private
  def cooking_detail_params
    params.require(:cooking_detail).permit(:image, :introduction)
  end
end
