class LookupsController < ApplicationController
  before_action :authorize_request
  before_action :set_alert, only: :index
  before_action :set_lookup, only: :show

  # GET /lookups
  def index
    render json: @alert.lookups.where('min_price IS NOT NULL').order(:created_at)
  end

  # GET /lookups/1
  def show
    render json: @lookup
  end

  private
    def set_alert
      @alert = Alert.find(params[:alert_id])
    end

    def set_lookup
      @lookup = Lookup.find(params[:id])
    end
end
