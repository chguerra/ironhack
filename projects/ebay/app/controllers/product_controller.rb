class ProductController < ApplicationController
  def new
    @product = Product.new
  end
  def index

  end
  def show

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
