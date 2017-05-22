class ItemsItsController < ApplicationController
  before_action :set_items_it, only: [:show, :update, :destroy]

  # GET /items_its
  def index
    @items_its = ItemsIt.all.order('updated_at DESC')

    render json: @items_its
  end

  # GET /items_its/1
  def show
    render json: @items_it
  end

  # POST /items_its
  def create
    @items_it = ItemsIt.new(items_it_params)

    if @items_it.save
      render json: @items_it, status: :created, location: @items_it
    else
      render json: @items_it.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items_its/1
  def update
    if @items_it.update(items_it_params)
      render json: @items_it
    else
      render json: @items_it.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items_its/1
  def destroy
    @items_it.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_it
      @items_it = ItemsIt.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def items_it_params
      params.require(:items_it).permit(:title, :url, :img, :site, :data)
    end
end
