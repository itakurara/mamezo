class PhotosController < ApplicationController
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
    else
      render 'new'
    end
  end


  private
    def photo_params
      params.require(:photo).permit(:file, :comment)
    end
end
