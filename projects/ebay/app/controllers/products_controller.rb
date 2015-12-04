class ProductsController < ApplicationController
  def new
    @user = User.find_by(id: params[:user_id])
    @product = Product.new
  end
  def index
    @user = User.find(params[:user_id])
  end
  def show
    @product = Product.find(params[:id])
  end
  def create
    @user = User.find_by(id: params[:user_id])
    @product = @user.products.new(entry_params)
    if @product.save
      redirect_to action: 'show', controller: 'products', id: @product.id , user_id: @user.id
    else
      render 'new'
    end
  end
  def destroy

  end
  private

  def entry_params
    params.require(:product).permit(:user, :id, :title, :description, :deadline,)
  end
end
