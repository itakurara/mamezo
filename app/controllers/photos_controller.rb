class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end
  def new
    @photo = Photo.new
  end

  def create
    upload_file = photo_params[:file]
    upload_filecomment = photo_params[:comment]

    if upload_file != nil
      photo = upload_file.read
    end
    @photo = Photo.new(file: photo, comment: upload_filecomment)
    if @photo.save
      @photos = Photo.all
      render 'static_pages/home'
    else
      render 'new'
    end
  end

  def show_image
    @photo = Photo.find(params[:id])
    send_data @photo.file, :type=> 'image/jpeg', :disposition => 'inline'
  end


  private
    def photo_params
      params.require(:photo).permit(:file, :comment)
    end
end
