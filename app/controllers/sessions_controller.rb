class SessionsController < ApplicationController
  def new
    @post = Post.all.limit(8)
  end

  def create
    @user = User.find_by_username(params[:username])
    # If the user exists AND the password entered is correct.
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      # If user's login doesn't work, send them back to the login form.
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end

end
