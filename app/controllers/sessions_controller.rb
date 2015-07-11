class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      # FIXME redirect_to root_pathがお勧めです。
      redirect_to '/'
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
