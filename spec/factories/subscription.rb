FactoryBot.define do
  factory :subscription do
    user_id { create(:user).id }
    amount { Faker::Number.within(range: 1..100) } 
    currency { Faker::Currency.code }
    card_type { "debit_card" }
    card_number { Faker::Bank.account_number(digits: 16) }
    card_expiry_month { (Time.now + 1.month).month }
    card_expiration_year { (Time.now + 1.year).year }
    authorization_code { Faker::Alphanumeric.alphanumeric(number: 16) }
    subscription_time { Time.now.utc } 
  end
end