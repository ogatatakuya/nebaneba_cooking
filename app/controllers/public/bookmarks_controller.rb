class Public::BookmarksController < ApplicationController
  before_action :authenticate_member!
  
  def index
    @bookmarks = Bookmark.where(member_id: current_member.id)
    @cooking = Cooking.find(params[:cooking_id])
  end
  
  def create
    @cooking = Cooking.find(params[:cooking_id])
    bookmark = @cooking.bookmarks.new(member_id: current_member.id)
    if bookmark.save
      redirect_to cooking_path(@cooking)
    else
      redirect_to cooking_path(@cooking)
    end
  end
  
  def destroy
    @cooking = Cooking.find(params[:cooking_id])
    bookmark = @cooking.bookmarks.find_by(member_id: current_member.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to cooking_path(@cooking)
    else
        redirect_to cooking_path(@cooking)
    end
  end
  
end
