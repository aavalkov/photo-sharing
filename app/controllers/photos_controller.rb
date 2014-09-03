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

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to user_path
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(:name => params[:photo][:name])
      flash[:notice] = "Photo was updated"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  private
    def photo_params
      params.require(:photo).permit(:name, :photo, :user_id)
    end
end
