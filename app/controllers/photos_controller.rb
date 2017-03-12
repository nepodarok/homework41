class PhotosController < ApplicationController

  def index
    @photos = Photo.all
  end

  def show

    @photo = Photo.find(params[:id])
    authorize! :read, @photo
  end

  def edit

    @photo = Photo.find(params[:id])
    authorize! :update, @photo
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      flash[:success] = "Фото загружено"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    authorize! :update, @photo
    Photo.find(params[:id]).destroy
    flash[:success] = "Фото успешно удалена!"
    redirect_to root_path
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update_attributes(photo_params)
      flash[:success] = "Фото отредактирован"
      redirect_to root_path
    else
      render 'edit'
    end
  end


          private

            def photo_params
              params.require(:photo).permit(:image, :user_id)
            end


end
