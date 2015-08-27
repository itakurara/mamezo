class PhotosController < ApplicationController
  def index
    @photos = Photo.order("created_at DESC").page(params[:page]).per(10)
  end

  def new
    @photo = Photo.new
  end

  def create
    upload_file = photo_params[:thumb]
    upload_filecomment = photo_params[:comment]

    #if upload_file.present?
    #  photo = upload_file.read
    #end
    @photo = Photo.new(thumb: upload_file, comment: upload_filecomment)
    if @photo.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show_image
    @photo = Photo.find(params[:id])
    send_data @photo.file, :type=> 'image/jpeg', :disposition => 'inline'
  end

  def like
    photo= Photo.find(params[:id])
    like_count = photo.like_count + 1
    photo.update(like_count: like_count)

    redirect_to root_path
  end


  private
    def photo_params
      params.require(:photo).permit(:thumb, :comment)
    end
end
