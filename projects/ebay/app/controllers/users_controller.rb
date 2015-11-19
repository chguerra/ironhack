class UsersController < ApplicationController
    def show
      @user = User.find(params[:id])
    end

    def create
      @user = User.new(entry_params)
      if @user.save
        redirect_to action: 'show', controller: 'users', id: @user.id
      else
        render 'new'
      end

    end

    def destroy

    end

    def new
      @user = User.new
    end
    private

    def entry_params
      params.require(:user).permit(:name, :id, :email)
    end

end
