class PhotosController < ApplicationController
  before_filter :authorize

  def new
    @photo = Photo.new
  end

  def create
    @user = User.find(params[:user_id])
    @photo = @user.photos.new(photo_params)
    if @photo.save
      session[:photo_id] = @photo.id
      flash[:notice] = "Photo was added"
      redirect_to users_path
    else
      render 'new'
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :photo, :user_id)
    end
end
