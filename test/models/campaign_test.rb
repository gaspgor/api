require "test_helper"

class CampaignTest < ActiveSupport::TestCase
  test "create campaign without required values" do
    campaign = Campaign.new
    assert_not campaign.save, "Campaign saved without required values"
  end
end
