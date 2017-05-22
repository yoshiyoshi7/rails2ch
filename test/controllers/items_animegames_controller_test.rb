require 'test_helper'

class ItemsAnimegamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_animegame = items_animegames(:one)
  end

  test "should get index" do
    get items_animegames_url, as: :json
    assert_response :success
  end

  test "should create items_animegame" do
    assert_difference('ItemsAnimegame.count') do
      post items_animegames_url, params: { items_animegame: { data: @items_animegame.data, img: @items_animegame.img, site: @items_animegame.site, title: @items_animegame.title, url: @items_animegame.url } }, as: :json
    end

    assert_response 201
  end

  test "should show items_animegame" do
    get items_animegame_url(@items_animegame), as: :json
    assert_response :success
  end

  test "should update items_animegame" do
    patch items_animegame_url(@items_animegame), params: { items_animegame: { data: @items_animegame.data, img: @items_animegame.img, site: @items_animegame.site, title: @items_animegame.title, url: @items_animegame.url } }, as: :json
    assert_response 200
  end

  test "should destroy items_animegame" do
    assert_difference('ItemsAnimegame.count', -1) do
      delete items_animegame_url(@items_animegame), as: :json
    end

    assert_response 204
  end
end
