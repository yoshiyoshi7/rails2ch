class ItemsNewsController < ApplicationController
  before_action :set_items_news, only: [:show, :update, :destroy]

  # GET /items_news
  def index
    @items_news = ItemsNews.all.order('updated_at DESC')

    render json: @items_news
  end

  # GET /items_news/1
  def show
    render json: @items_news
  end

  # POST /items_news
  def create
    @items_news = ItemsNews.new(items_news_params)

    if @items_news.save
      render json: @items_news, status: :created, location: @items_news
    else
      render json: @items_news.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /items_news/1
  def update
    if @items_news.update(items_news_params)
      render json: @items_news
    else
      render json: @items_news.errors, status: :unprocessable_entity
    end
  end

  # DELETE /items_news/1
  def destroy
    @items_news.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_items_news
      @items_news = ItemsNews.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def items_news_params
      params.require(:items_news).permit(:title, :url, :img, :site, :data)
    end
end
