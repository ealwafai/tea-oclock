class Api::V1::MembershipsController < ApplicationController
  def index
    customer = Customer.find(params[:customer_id])

    memberships = customer.memberships if customer

    json_response(MembershipsSerializer.new(memberships))
  end

  def create
    customer = Customer.find(params[:customer_id])
    tea = Tea.find(params[:tea_id])
    subscription = Subscription.find(params[:subscription_id])
    membership = customer.memberships.create!(membership_params)

    json_response(MembershipsSerializer.new(membership))
  end

  def update
    customer = Customer.find(params[:customer_id])
    membership = customer.memberships.where(id: params[:id]).first
    membership.update!(membership_params)

    json_response(MembershipsSerializer.new(membership))
  end

  private

  def membership_params
    params.permit(:id, :customer_id, :tea_id, :subscription_id, :active)
  end
end
