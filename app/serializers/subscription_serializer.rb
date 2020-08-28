class SubscriptionSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :amount, :currency, :card_type, :card_details, :status, :authorization_code, :subscription_time

  def card_details
    {
      number: object.card_number,
      expiry_month: object.card_expiry_month,
      expiry_year: object.card_expiration_year,
    }
  end

  def status
    if object
      "Success"
    else
      "Failed"
    end
  end

  def amount
    object.amount || 0
  end
end
