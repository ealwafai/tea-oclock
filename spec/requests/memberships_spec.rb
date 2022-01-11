require 'rails_helper'

RSpec.describe 'Memberships API' do
  describe 'GET /api/v1/customers/:id/memberships' do
    context 'when subcriptions exist' do
      before(:each) do
        @customer = create(:customer)
        tea_1 = create(:tea)
        tea_2 = create(:tea)
        subscription = create(:subscription)
        @membership_1 = create(:membership, customer: @customer, tea: tea_1, subscription: subscription)
        @membership_2 = create(:membership, customer: @customer, tea: tea_2, subscription: subscription)
      end

      it 'shows all the customers tea memberships' do
        get "/api/v1/customers/#{@customer.id}/memberships"

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data].count).to eq(2)
        expect(results[:data].first[:type]).to eq("memberships")
        expect(results[:data].first[:attributes].keys).to eq([:tea_id, :customer_id, :subscription_id, :active])
      end

      it 'shows all the customers tea memberships that are active and inactive' do
        expect(@membership_1.active).to eq(true)

        get "/api/v1/customers/#{@customer.id}/memberships"

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data].count).to eq(2)

        @membership_1.active = false

        get "/api/v1/customers/#{@customer.id}/memberships"

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data].count).to eq(2)
      end
    end

    context 'when subscriptions dont exist' do
      it 'returns empty result' do
        customer = create(:customer)

        get "/api/v1/customers/#{customer.id}/memberships"

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data].count).to eq(0)
      end
    end
  end
end
