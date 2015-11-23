class CommentsController < ApplicationController
  def new
    @concert = Concert.find(params[:concert_id])
    @comment = Comment.new
  end

  def create
    @concert = Concert.find(params[:concert_id])
    @entry = Comment.new(entry_params)

    if @concert.comments << @entry
      redirect_to action: 'show', controller: 'concerts', id: @concert.id
    else
      render 'new'
    end
  end



  private

	def entry_params
		params.require(:comment).permit(:text, :concert_id)
	end
end
