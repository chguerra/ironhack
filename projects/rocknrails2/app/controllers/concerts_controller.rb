class ConcertsController < ApplicationController
  def index
    @concerts = Concert.where(date: Date.today.beginning_of_day..Date.today.end_of_day)
    @next_events = Concert.where(date: Date.tomorrow.beginning_of_day..Date.today.end_of_month)

  end

  def show
    @concert = Concert.find(params[:id])
  end

  def new
    @concert = Concert.new
    @cities = City.all
  end

  def search
    @concerts = Concert.where('price < ?', params[:price].to_i).sort {|a, b| a[:price] <=> b[:price]}
      @next_events = Concert.where(date: Date.tomorrow.beginning_of_day..Date.today.end_of_month)
      render 'search'
  end

  def mostcommented
    @concerts = Concert.all.sort {|a, b| b.comments.count <=> a.comments.count}
    @next_events = Concert.where(date: Date.tomorrow.beginning_of_day..Date.today.end_of_month)
      render 'mostcommented'
  end

  def create
    @entry = Concert.new(entry_params)

    if @entry.save
    	redirect_to action: 'show', controller: 'concerts', id: Concert.last.id

    end
  end

  def destroy

  end

  def update

  end
  private

	def entry_params
		params.require(:concert).permit(:id, :band,:venue,:city,:date,:price,:description)
    params.permit(:price)
    params.require(:city).permit(:name)
	end
end
