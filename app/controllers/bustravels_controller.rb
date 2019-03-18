class BustravelsController < ApplicationController
  before_action :authorize_request
  before_action :set_lookup, only: :index

  # GET /lookups/latest/bustravels
  def index
    render json: @lookup.bus_travels
  end

  private
    def set_lookup
      @lookup = Lookup.last
    end
end
