class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to '/users'
      else
        render 'new'
      end

    end

    def home
      render :index
    end

    def destroy

    end

    def index
      if current_user.nil?
        @name = "Visitor"
      else
        @name = current_user.name
      end
      @users = User.all
    end

    def new
      @user = User.new
    end
    private

    def user_params
      params.require(:user).permit(:name, :id, :email, :password, :password_confirmation)
    end

end
