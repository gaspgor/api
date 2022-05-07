require "test_helper"

class BannerTest < ActiveSupport::TestCase
  test "create banner without required values" do
    banner = Banner.new
    assert_not banner.save, "Banner saved without required values"
  end
end
