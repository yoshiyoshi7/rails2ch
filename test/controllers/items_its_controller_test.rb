require 'test_helper'

class ItemsItsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_it = items_its(:one)
  end

  test "should get index" do
    get items_its_url, as: :json
    assert_response :success
  end

  test "should create items_it" do
    assert_difference('ItemsIt.count') do
      post items_its_url, params: { items_it: { data: @items_it.data, img: @items_it.img, site: @items_it.site, title: @items_it.title, url: @items_it.url } }, as: :json
    end

    assert_response 201
  end

  test "should show items_it" do
    get items_it_url(@items_it), as: :json
    assert_response :success
  end

  test "should update items_it" do
    patch items_it_url(@items_it), params: { items_it: { data: @items_it.data, img: @items_it.img, site: @items_it.site, title: @items_it.title, url: @items_it.url } }, as: :json
    assert_response 200
  end

  test "should destroy items_it" do
    assert_difference('ItemsIt.count', -1) do
      delete items_it_url(@items_it), as: :json
    end

    assert_response 204
  end
end
