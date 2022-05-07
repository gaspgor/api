class CampaignsController < ApplicationController
  before_action :limit_param_validation, only: %i[ index ]
  before_action :set_campaign, only: %i[ show update destroy ]

  # GET /campaigns
  def index
    campaigns_count = Campaign.count
    campaigns = Campaign.all.offset(@offset).limit(@limit)
    render json: {
      data: campaigns,
      count: campaigns_count,
    }
  end

  # GET /campaigns/1
  def show
    render json: @campaign
  end

  # POST /campaigns
  def create
    campaign = Campaign.new(campaign_params)

    if campaign.save
      render json: campaign, status: :created, location: campaign
    else
      render json: campaign.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /campaigns/1
  def update
    if @campaign.update(campaign_params)
      render json: @campaign
    else
      render json: @campaign.errors, status: :unprocessable_entity
    end
  end

  # DELETE /campaigns/1
  def destroy
    @campaign.destroy
  end

  private
    def set_campaign
      @campaign = Campaign.find(params[:id])
    end

    def limit_param_validation
      params.permit(:limit, :offset)
      @limit = params[:limit]
      @offset = params[:offset]
    end

    def campaign_params
      params.require(:campaign).permit(:name, :banners, :activityChart)
    end
end
