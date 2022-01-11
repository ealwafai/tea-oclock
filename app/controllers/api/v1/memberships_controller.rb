class Api::V1::MembershipsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])

    memberships = customer.memberships if customer

    render json: MembershipsSerializer.new(memberships), status: :ok
  end

  private

  def memberships_params
    params.permit(:id, :customer_id, :tea_id, :subscription_id, :active)
  end
end
