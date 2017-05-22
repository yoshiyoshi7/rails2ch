require 'test_helper'

class ItemsLivesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_life = items_lives(:one)
  end

  test "should get index" do
    get items_lives_url, as: :json
    assert_response :success
  end

  test "should create items_life" do
    assert_difference('ItemsLife.count') do
      post items_lives_url, params: { items_life: { data: @items_life.data, img: @items_life.img, site: @items_life.site, title: @items_life.title, url: @items_life.url } }, as: :json
    end

    assert_response 201
  end

  test "should show items_life" do
    get items_life_url(@items_life), as: :json
    assert_response :success
  end

  test "should update items_life" do
    patch items_life_url(@items_life), params: { items_life: { data: @items_life.data, img: @items_life.img, site: @items_life.site, title: @items_life.title, url: @items_life.url } }, as: :json
    assert_response 200
  end

  test "should destroy items_life" do
    assert_difference('ItemsLife.count', -1) do
      delete items_life_url(@items_life), as: :json
    end

    assert_response 204
  end
end
