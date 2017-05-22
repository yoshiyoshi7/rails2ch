class ItemsEntertainersController < ApplicationController
  before_action :set_items_entertainer, only: [:show, :update, :destroy]

  # GET /items_entertainers
  def index
    @items_entertainers = ItemsEntertainer.all.order('updated_at DESC')

    render json: @items_entertainers
  end

  # GET /items_entertainers/1
  def show
    render json: @items_entertainer
  end

  # POST /items_entertainers
  def create
    @items_entertainer = ItemsEntertainer.new(items_entertainer_params)

    if @items_entertainer.save
      render json: @items_entertainer, status: :created, location: @items_entertainer
    else
      render json: @items_entertainer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items_entertainers/1
  def update
    if @items_entertainer.update(items_entertainer_params)
      render json: @items_entertainer
    else
      render json: @items_entertainer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items_entertainers/1
  def destroy
    @items_entertainer.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_entertainer
      @items_entertainer = ItemsEntertainer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def items_entertainer_params
      params.require(:items_entertainer).permit(:title, :url, :img, :site, :data)
    end
end
