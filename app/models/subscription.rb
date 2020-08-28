class Subscription < ApplicationRecord
  belongs_to :user
  enum card_type: { debit_card: 1, credit_card: 2}

  after_commit :assign_authorization_code

  validates_presence_of :card_number, message: 'must be entered'
  validates :card_expiry_month, presence: true, numericality: { greater_than_or_equal_to: Time.now.month, less_than_or_equal_to: 12 }
  validates :card_expiration_year, presence: true, numericality: { greater_than_or_equal_to: Time.now.year }
  validates :amount, presence: true, numericality: { greater_than: 0 }


  def create_payment_plan(subscription_params, user_id)
    Subscription.create({
      amount: subscription_params[:amount],
      currency: subscription_params[:currency],
      card_type: subscription_params[:card_type],
      card_number: subscription_params[:card_number],
      card_expiry_month: subscription_params[:card_expiry_month],
      card_expiration_year: subscription_params[:card_expiration_year],
      user_id: user_id,
      subscription_time: Time.now.utc
    })
  end

  def assign_authorization_code
    authorization_code = SecureRandom.hex
    update_column(:authorization_code, authorization_code)
  end
end
