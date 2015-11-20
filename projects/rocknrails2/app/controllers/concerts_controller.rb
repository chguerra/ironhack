class ConcertsController < ApplicationController
  def index
    @concerts = Concert.where(date: Date.today.beginning_of_day..Date.today.end_of_day)
    @next_events = Concert.where(date: Date.today.beginning_of_day..Date.today.end_of_month)

  end

  def show
    @concert = Concert.find(params[:id])
  end

  def new
    @concert = Concert.new
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
	end
end
