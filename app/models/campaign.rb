require 'json'

class Campaign < ApplicationRecord
  validates :name, presence: true
  validates :banners, presence: true
  validates :activityChart, presence: true
  validates :status, presence: true

  after_initialize do |campaign|
    time = Time.new
    hour = time.hour.to_i
    activityChart = JSON.parse(campaign.activityChart)
    status = 0
    activityChart.each do |activity|
      from = activity["from"].split(":")[0].to_i
      to = activity["to"] === "" ? from + 1 : activity["to"].split(":")[0].to_i
      if hour >= from && hour < to
        status = 1
      end
    end
    campaign.update({ status: status })
  end
end
