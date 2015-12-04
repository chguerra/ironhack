require 'pry'
class BarbecuesController < ApplicationController

  before_action :authenticate_user!, only: [:show, :new, :index, :create]

  def index
    @barbecues = Barbecue.order(:date)
    @participations = Participation.all
    @current_user = current_user

  end

  def show
    # Don't add any code to this show action.
    # Implement your barbecue API in another action.
  end

  def new
    @bbq = Barbecue.new
  end

  def api_show
    @bbq = Barbecue.find(params[:id])
    render json: @bbq
  end

  def add_participant
    result = Participation.create(user_id: current_user.id, barbecue_id: params[:id])
    render status: 201, json: result
  end

  def create
    bbq_params = params.require(:barbecue).permit(:title, :venue, :date)
    @bbq = Barbecue.new(bbq_params)

    unless @bbq.save
      render(:new)
    else
      redirect_to(barbecues_path)
    end
  end
end
