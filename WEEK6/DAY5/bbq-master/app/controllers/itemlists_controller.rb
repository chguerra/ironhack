class ItemlistsController < ApplicationController
  def show
    itemlist = Itemlist.where(barbecue_id: params[:id])
    render status: 200, json: itemlist
  end
  def add_item
    result = Itemlist.create(item_name: params[:item], barbecue_id: params[:id])
    render json: result, status: 201
  end
end
