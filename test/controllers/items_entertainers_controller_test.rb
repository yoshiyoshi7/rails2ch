require 'test_helper'

class ItemsEntertainersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_entertainer = items_entertainers(:one)
  end

  test "should get index" do
    get items_entertainers_url, as: :json
    assert_response :success
  end

  test "should create items_entertainer" do
    assert_difference('ItemsEntertainer.count') do
      post items_entertainers_url, params: { items_entertainer: { data: @items_entertainer.data, img: @items_entertainer.img, site: @items_entertainer.site, title: @items_entertainer.title, url: @items_entertainer.url } }, as: :json
    end

    assert_response 201
  end

  test "should show items_entertainer" do
    get items_entertainer_url(@items_entertainer), as: :json
    assert_response :success
  end

  test "should update items_entertainer" do
    patch items_entertainer_url(@items_entertainer), params: { items_entertainer: { data: @items_entertainer.data, img: @items_entertainer.img, site: @items_entertainer.site, title: @items_entertainer.title, url: @items_entertainer.url } }, as: :json
    assert_response 200
  end

  test "should destroy items_entertainer" do
    assert_difference('ItemsEntertainer.count', -1) do
      delete items_entertainer_url(@items_entertainer), as: :json
    end

    assert_response 204
  end
end
