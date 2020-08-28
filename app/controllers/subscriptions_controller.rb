class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    subscription = Subscription.all.where(user_id: current_user.id)
    if subscription.empty?
      render json: { status: "No Data Found", data: "No Data Found, try adding some subscriptions"}, status: 201
    else
      render json: subscription, status: 200
    end
  end

  def create
    subscription = Subscription.new.create_payment_plan(subscription_params, current_user.id)
    if subscription.save!
      render json: subscription, serializer: SubscriptionSerializer, status: 200
    else
      render json: { errors: @subscription.errors.full_messages.to_sentence }, status: 422
    end
  end

  private

  def subscription_params
    params.permit(:amount, :currency, :card_number, :card_expiry_month, :card_expiration_year, :card_type)
  end
end
