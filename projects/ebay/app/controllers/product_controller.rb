require 'pry'

class ProductController < ApplicationController
  def new
    binding.pry
    @user = User.find_by(id: params[:user_id])
    @product = Product.new
  end

  def index

  end
  def show
    @product = Product.find(params[:id])
  end
  def create
    @product = Product.new(entry_params)
    if @product.save
      redirect_to action: 'show', controller: 'product', id: @product.id
    else
      render 'new'
    end
  end
  def destroy

  end
  private

  def entry_params
    params.require(:product).permit(:user, :id, :title, :description, :deadline, :user_id)
  end
end
