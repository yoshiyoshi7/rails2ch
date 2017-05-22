require 'test_helper'

class ItemsNewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_news = items_news(:one)
  end

  test "should get index" do
    get items_news_index_url, as: :json
    assert_response :success
  end

  test "should create items_news" do
    assert_difference('ItemsNews.count') do
      post items_news_index_url, params: { items_news: { data: @items_news.data, img: @items_news.img, site: @items_news.site, title: @items_news.title, url: @items_news.url } }, as: :json
    end

    assert_response 201
  end

  test "should show items_news" do
    get items_news_url(@items_news), as: :json
    assert_response :success
  end

  test "should update items_news" do
    patch items_news_url(@items_news), params: { items_news: { data: @items_news.data, img: @items_news.img, site: @items_news.site, title: @items_news.title, url: @items_news.url } }, as: :json
    assert_response 200
  end

  test "should destroy items_news" do
    assert_difference('ItemsNews.count', -1) do
      delete items_news_url(@items_news), as: :json
    end

    assert_response 204
  end
end
