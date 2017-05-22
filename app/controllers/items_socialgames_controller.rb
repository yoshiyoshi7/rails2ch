class ItemsSocialgamesController < ApplicationController
  before_action :set_items_socialgame, only: [:show, :update, :destroy]

  # GET /items_socialgames
  def index
    @items_socialgames = ItemsSocialgame.all.order('updated_at DESC')

    render json: @items_socialgames
  end

  # GET /items_socialgames/1
  def show
    render json: @items_socialgame
  end

  # POST /items_socialgames
  def create
    @items_socialgame = ItemsSocialgame.new(items_socialgame_params)

    if @items_socialgame.save
      render json: @items_socialgame, status: :created, location: @items_socialgame
    else
      render json: @items_socialgame.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items_socialgames/1
  def update
    if @items_socialgame.update(items_socialgame_params)
      render json: @items_socialgame
    else
      render json: @items_socialgame.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items_socialgames/1
  def destroy
    @items_socialgame.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_socialgame
      @items_socialgame = ItemsSocialgame.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def items_socialgame_params
      params.require(:items_socialgame).permit(:title, :url, :img, :site, :data)
    end
end
