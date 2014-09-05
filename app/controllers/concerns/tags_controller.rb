class TagsController < ApplicationController

  def new
    @tag = Tag.new(tags_params)
  end

  def create
    @tag = Tag.new(tags_params)
    if @tag.save
      @photo.tags.create
      flash[:notice] = "Tag added"
      redirect_to user_path(current_user)
    else
      render "user/'#{current_user.id}'"
    end
  end

  private
    def tags_params
      params.require(:tag).permit(:name, :photo_ids)
    end
end
