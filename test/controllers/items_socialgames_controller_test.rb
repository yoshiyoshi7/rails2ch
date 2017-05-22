require 'test_helper'

class ItemsSocialgamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_socialgame = items_socialgames(:one)
  end

  test "should get index" do
    get items_socialgames_url, as: :json
    assert_response :success
  end

  test "should create items_socialgame" do
    assert_difference('ItemsSocialgame.count') do
      post items_socialgames_url, params: { items_socialgame: { data: @items_socialgame.data, img: @items_socialgame.img, site: @items_socialgame.site, title: @items_socialgame.title, url: @items_socialgame.url } }, as: :json
    end

    assert_response 201
  end

  test "should show items_socialgame" do
    get items_socialgame_url(@items_socialgame), as: :json
    assert_response :success
  end

  test "should update items_socialgame" do
    patch items_socialgame_url(@items_socialgame), params: { items_socialgame: { data: @items_socialgame.data, img: @items_socialgame.img, site: @items_socialgame.site, title: @items_socialgame.title, url: @items_socialgame.url } }, as: :json
    assert_response 200
  end

  test "should destroy items_socialgame" do
    assert_difference('ItemsSocialgame.count', -1) do
      delete items_socialgame_url(@items_socialgame), as: :json
    end

    assert_response 204
  end
end
