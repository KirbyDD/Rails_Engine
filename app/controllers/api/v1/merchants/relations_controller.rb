class Api::V1::Merchants::RelationsController < ApplicationController
  def index
    render json: ItemSerializer.new(Merchant.find(params[:id]).items)
  end
end
