class AlertsController < ApplicationController
  before_action :authorize_request
  before_action :set_alert, only: [:show, :update, :destroy]

  # GET /alerts
  def index
    @alerts = Alert.where(user_id: @current_user.id).actives

    render json: @alerts
  end

  # GET /alerts/1
  def show
    render json: @alert
  end

  # POST /alerts
  def create
    @alert = Alert.new(alert_params.merge(user_id: @current_user.id))

    if @alert.save
      render json: @alert, status: :created, location: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /alerts/1
  def update
    if @alert.update(alert_params)
      render json: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  # DELETE /alerts/1
  def destroy
    @alert.update(active: false)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = Alert.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def alert_params
      params.require(:alert).permit(:name, :departure_city_id, :destination_city_id, :price, :service_stars)
    end
end
