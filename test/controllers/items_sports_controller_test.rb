require 'test_helper'

class ItemsSportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @items_sport = items_sports(:one)
  end

  test "should get index" do
    get items_sports_url, as: :json
    assert_response :success
  end

  test "should create items_sport" do
    assert_difference('ItemsSport.count') do
      post items_sports_url, params: { items_sport: { data: @items_sport.data, img: @items_sport.img, site: @items_sport.site, title: @items_sport.title, url: @items_sport.url } }, as: :json
    end

    assert_response 201
  end

  test "should show items_sport" do
    get items_sport_url(@items_sport), as: :json
    assert_response :success
  end

  test "should update items_sport" do
    patch items_sport_url(@items_sport), params: { items_sport: { data: @items_sport.data, img: @items_sport.img, site: @items_sport.site, title: @items_sport.title, url: @items_sport.url } }, as: :json
    assert_response 200
  end

  test "should destroy items_sport" do
    assert_difference('ItemsSport.count', -1) do
      delete items_sport_url(@items_sport), as: :json
    end

    assert_response 204
  end
end
