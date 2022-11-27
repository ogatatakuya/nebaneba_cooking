class Admin::MembersController < ApplicationController
  
  def index
    @members = Member.page(params[:page])
    #@members = @members.page(params[:page])
  end
  
  def show
    @member = Member.find(params[:id])
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to adnin_member_path(@member)
    else
      redirect_to edit_admin_member_path(member_id)
    end
  end
  
  private
  def member_params
    params.require(:member).permit(:name, :email, :profile_image, :is_deleted)
    
  end
end
