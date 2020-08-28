require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context 'associations' do
    it { should belong_to :user }
  end
  context 'validations' do
    it { should validate_presence_of(:card_number) }
    it { should validate_presence_of(:card_expiry_month) }
    it { should validate_presence_of(:card_expiration_year) }
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:card_expiry_month).is_greater_than_or_equal_to(Time.now.month) }
    it { should validate_numericality_of(:card_expiry_month).is_less_than_or_equal_to(12) }
    it { should validate_numericality_of(:card_expiration_year).is_greater_than_or_equal_to(Time.now.year) }
    it { should validate_numericality_of(:amount).is_greater_than(0) }
  end
end