class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
    end

    def show
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to register_path
      end
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
    end




end
