class ItemsAnimegamesController < ApplicationController
  before_action :set_items_animegame, only: [:show, :update, :destroy]

  # GET /items_animegames
  def index
    @items_animegames = ItemsAnimegame.all.order('updated_at DESC')

    render json: @items_animegames
  end

  # GET /items_animegames/1
  def show
    render json: @items_animegame
  end

  # POST /items_animegames
  def create
    @items_animegame = ItemsAnimegame.new(items_animegame_params)

    if @items_animegame.save
      render json: @items_animegame, status: :created, location: @items_animegame
    else
      render json: @items_animegame.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items_animegames/1
  def update
    if @items_animegame.update(items_animegame_params)
      render json: @items_animegame
    else
      render json: @items_animegame.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items_animegames/1
  def destroy
    @items_animegame.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_animegame
      @items_animegame = ItemsAnimegame.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def items_animegame_params
      params.require(:items_animegame).permit(:title, :url, :img, :site, :data)
    end
end
