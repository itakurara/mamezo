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

    # FIXME !=という書き方はRubyではあまりしません。unless upload_file.nil?
    # もしくはRailsならif upload_file.present?がいいです。
    # present?はRailsの世界においては使いどころが広いので、ガンガン使って行きましょう。
    # （使ってはまずい部分もあるのですが、それはまた後の話で）
    if upload_file != nil
      photo = upload_file.read
    end
    @photo = Photo.new(file: photo, comment: upload_filecomment)
    if @photo.save
      # FIXME static_pages/homeにrenderしていますが、static_pagesはorder(DESC)しているので、
      # 動きを統一したほうがいいと思います。
      # renderではなく、redirect_to root_pathとすると、
      # @photos = Photo.allはStaticPagesControllerの方に任せることができます。
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
