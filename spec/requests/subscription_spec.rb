require 'rails_helper'
include ActionController::RespondWith

RSpec.describe "Subscription", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:auth_headers) { user.create_new_auth_token }
  before(:each) do
    @subscription =  FactoryBot.create(:subscription, user_id: user.id)
    @subscriptions_url = '/subscriptions'
    @subscriptions_params = {
      amount: @subscription.amount,
      currency: @subscription.currency,
      card_type: @subscription.card_type,
      card_number: @subscription.card_number,
      card_expiry_month: @subscription.card_expiry_month,
      card_expiration_year: @subscription.card_expiration_year,
      subscription_time: @subscription.subscription_time
    }
  end
  describe 'Create Subscription Methods' do
    describe 'POST /subscriptions/' do
      context 'when subscriptions params is valid' do
        before{
          sign_in user
          post @subscriptions_url,
          params: @subscriptions_params.to_json,
          headers: {
            'CONTENT_TYPE' => 'application/json',
            'ACCEPT' => 'application/json',
            'Uid' => auth_headers['uid'],
            'Access-Token' => auth_headers['access-token'],
            'Client' => auth_headers['client']
          }
        }
        it 'returns status 200' do
          expect(response.status).to eq(200)
        end
        it 'returns right attributes for a subscription' do
          json_response = JSON.parse(response.body)
          expect(json_response.keys).to match_array(["amount", "authorization_code", "card_details", "card_type", "currency", "id", "status", "subscription_time"])
        end
      end
    end
  end
  describe 'Get Subscriptions' do
    describe 'GET /subscriptions/' do
      context 'when subscriptions exist' do
        before{
          sign_in user
          get @subscriptions_url,
          headers: {
            'CONTENT_TYPE' => 'application/json',
            'ACCEPT' => 'application/json',
            'Uid' => auth_headers['uid'],
            'Access-Token' => auth_headers['access-token'],
            'Client' => auth_headers['client']
          }
        }
        it 'returns status 200' do
          expect(response.status).to eq(200)
        end
        it 'returns right attributes' do
          json_response = JSON.parse(response.body)
          expect(json_response[0].keys).to match_array(["amount", "authorization_code", "card_details", "card_type", "currency", "id", "status", "subscription_time"])
        end
      end
    end
  end
end