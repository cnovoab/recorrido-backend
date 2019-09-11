class CitiesController < ApplicationController
  before_action :authorize_request

  # GET /alerts
  def index
    @cities = City.all.map(&:present)

    render json: @cities
  end
end
