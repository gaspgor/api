class BannersController < ApplicationController
  before_action :limit_param_validation, only: %i[ index ]
  before_action :set_banner, only: %i[ show update destroy ]

  # GET /banners
  def index
    banners_count = Banner.count
    banners = Banner.all.offset(@offset).limit(@limit)
    render json: {
      data: banners,
      count: banners_count,
    }
  end

  def search

  end

  # GET /banners/1
  def show
    render json: @banner
  end

  # POST /banners
  def create
    banner = Banner.new(banner_params)

    if banner.save
      render json: banner, status: :created, location: banner
    else
      render json: banner.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /banners/1
  def update
    if @banner.update(banner_params)
      render json: @banner
    else
      render json: @banner.errors, status: :unprocessable_entity
    end
  end

  # DELETE /banners/1
  def destroy
    @banner.destroy
  end

  private
    def set_banner
      @banner = Banner.find(params[:id])
    end

    def limit_param_validation
      params.permit(:limit, :offset)
      @limit = params[:limit]
      @offset = params[:offset]
    end

    def banner_params
      params.require(:banner).permit(:name, :text)
    end
end
