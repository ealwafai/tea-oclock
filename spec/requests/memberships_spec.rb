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

  describe 'create action' do
    context 'POST /api/v1/customers/:id/memberships' do
      before(:each) do
        @customer = create(:customer)
        @tea = create(:tea)
        @subscription = create(:subscription)
      end

      it 'creates customer tea membership and returns the information in json' do
        post "/api/v1/customers/#{@customer.id}/memberships", params: { customer_id: @customer.id, tea_id: @tea.id, subscription_id: @subscription.id }

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:data].keys).to eq([:id, :type, :attributes])
        expect(results[:data][:attributes][:tea_id]).to eq(@tea.id)
        expect(results[:data][:attributes][:customer_id]).to eq(@customer.id)
        expect(results[:data][:attributes][:subscription_id]).to eq(@subscription.id)
      end
    end

    context 'when creating tea membership is unsuccessful' do
      before(:each) do
        @customer = create(:customer)
        @tea = create(:tea)
        @subscription = create(:subscription)
      end

      it 'returns error when tea doesnt exist' do
        post "/api/v1/customers/#{@customer.id}/memberships", params: { customer_id: @customer.id, tea_id: (@tea.id - 1), subscription_id: @subscription.id }

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:errors]).to eq(["Couldn't find Tea with 'id'=#{(@tea.id - 1)}"])
      end

      it 'returns error when customer doesnt exist' do
        post "/api/v1/customers/#{@customer.id - 1}/memberships", params: { customer_id: @customer.id, tea_id: (@tea.id - 1), subscription_id: @subscription.id }

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:errors]).to eq(["Couldn't find Customer with 'id'=#{@customer.id - 1}"])
      end

      it 'returns an error when subscription doesnt exist' do
        post "/api/v1/customers/#{@customer.id}/memberships", params: { customer_id: @customer.id, tea_id: @tea.id, subscription_id: (@subscription.id - 1) }

        results = JSON.parse(response.body, symbolize_names: true)

        expect(results[:errors]).to eq(["Couldn't find Subscription with 'id'=#{(@subscription.id - 1)}"])
      end
    end
  end
end
