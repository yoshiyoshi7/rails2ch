class ItemsLivesController < ApplicationController
  before_action :set_items_life, only: [:show, :update, :destroy]

  # GET /items_lives
  def index
    @items_lives = ItemsLife.all.order('updated_at DESC')

    render json: @items_lives
  end

  # GET /items_lives/1
  def show
    render json: @items_life
  end

  # POST /items_lives
  def create
    @items_life = ItemsLife.new(items_life_params)

    if @items_life.save
      render json: @items_life, status: :created, location: @items_life
    else
      render json: @items_life.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items_lives/1
  def update
    if @items_life.update(items_life_params)
      render json: @items_life
    else
      render json: @items_life.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items_lives/1
  def destroy
    @items_life.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_life
      @items_life = ItemsLife.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def items_life_params
      params.require(:items_life).permit(:title, :url, :img, :site, :data)
    end
end
