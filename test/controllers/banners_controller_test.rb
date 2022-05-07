require "test_helper"

class BannersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @banner = banners(:one)
  end

  test "should get index" do
    get banners_url, as: :json
    assert_response :success
  end

  test "should create banner" do
    assert_difference("Banner.count") do
      post banners_url, params: { banner: { name: @banner.name, text: @banner.text } }, as: :json
    end

    assert_response :created
  end

  test "should show banner" do
    get banner_url(@banner), as: :json
    assert_response :success
  end

  test "should update banner" do
    patch banner_url(@banner), params: { banner: { name: @banner.name, text: @banner.text } }, as: :json
    assert_response :success
  end

  test "should destroy banner" do
    assert_difference("Banner.count", -1) do
      delete banner_url(@banner), as: :json
    end

    assert_response :no_content
  end
end
