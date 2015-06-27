class StaticPagesController < ApplicationController
  def home
    @photos = Photo.order('created_at DESC')
  end
end
