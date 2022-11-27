class Public::MembersController < ApplicationController
  
  def show
    @member = Member.find(params[:id])
    @cookings = @member.cookings
  end
  
  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to member_path(@member)
    else
      redirect_to edit_member_path(@member)
    end
  end
  
  def quit
   
  end
  
  def out
    @member = Member.find(current_member.id)
    @member.update(is_deleted: "true")
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  def member_params
    params.require(:member).permit(:name, :email, :profile_image, :is_deleted)
    
  end
end
