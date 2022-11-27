class Public::CookingsController < ApplicationController
  #before_action
  
  def new
    @cooking = Cooking.new
    @tags = Tag.all
  end
  
  def add
    #@cooking = Cooking.find(params[:**id])
    #@cooking*** = @cooking.cooking***.new(cooking_params)
    #@cooking***.member_id = current_member.id
     #if @cooking***.save
      #redirect_to cooking_path(@cooking.id)
    # else
      #redirect_to new_cooking***_path
    # end
  end
  
  def index
   # @tag = Tag.find(params[:tag_id])
    #cookings = @tag.cookings.order(created_at: :desc)
    if params[:tag].present?
      #cookings = Cooking.joins(:tags).where("tags.id = ?", params[:tag])
      
      cookings = Cooking.where(tag_id: params[:tag])
    else
      cookings = Cooking.all
    end
   
    @tags = Tag.all
    @cookings = Kaminari.paginate_array(cookings).page(params[:page]).per(15)
    @cooking = Cooking.new
    
  end
  
  def show
    @cooking = Cooking.find(params[:id])
    #@cooking_detail = CookingDetail.find(params[:id])
    #@cooking_detail.member_id = current_member.id
    @cooking_details = @cooking.cooking_details
    @cooking_comment = CookingComment.new
    @cooking_comments = @cooking.cooking_comments.order(created_at: :desc)
    @member = @cooking.member
  end
  
  def create
    @cooking = Cooking.new(cooking_params)
    #tag = params[:cooking][:tag_name].split(nil)
    @cooking.member_id = current_member.id
    if @cooking.save
       #@cooking.save_cookings(tag)
      redirect_to cooking_path(@cooking)
    else
      redirect_to new_cooking_path
    end
    #@cooking = current_member.cookings.new(cooking_params)
    #if @cooking.save
    #  redirect_back(fallback_location: root_path)
    #else
    #  redirect_back(fallback_location: root_path)
   # end
  end
  
  def edit
    @cooking = Cooking.find(params[:id])
    @tags = Tag.all
  end
  
  def update
    @cooking = Cooking.find(params[:id])
    if @cooking.update(cooking_params)
      redirect_to cooking_path(@cooking)
    else
      redirect_to edit_cooking_path(@cooking.id)
    end
  end
  
  def destroy
    @cooking = Cooking.find(params[:id])
    @cooking.destroy
    redirect_to cookings_path
  end
  
  def search
    @cookings = Cooking.search(params[:keyword]).page(params[:page])
    @keyword = params[:keyword]
    @tags = Tag.all
    render "index"
  end
  
  private
  def cooking_params
    params.require(:cooking).permit(:comment, :name, :image, :introduction, :tag_id, :member_id, :bookmark_id)
  end
  
  
end
