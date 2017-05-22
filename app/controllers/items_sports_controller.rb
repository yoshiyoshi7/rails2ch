class ItemsSportsController < ApplicationController
  before_action :set_items_sport, only: [:show, :update, :destroy]

  # GET /items_sports
  def index
    @items_sports = ItemsSport.all.order('updated_at DESC')

    render json: @items_sports
  end

  # GET /items_sports/1
  def show
    render json: @items_sport
  end

  # POST /items_sports
  def create
    @items_sport = ItemsSport.new(items_sport_params)

    if @items_sport.save
      render json: @items_sport, status: :created, location: @items_sport
    else
      render json: @items_sport.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items_sports/1
  def update
    if @items_sport.update(items_sport_params)
      render json: @items_sport
    else
      render json: @items_sport.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items_sports/1
  def destroy
    @items_sport.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_sport
      @items_sport = ItemsSport.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def items_sport_params
      params.require(:items_sport).permit(:title, :url, :img, :site, :data)
    end
end
