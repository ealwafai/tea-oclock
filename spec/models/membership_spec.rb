require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe 'associations' do
    it { should belong_to(:customer) }
    it { should belong_to(:tea) }
    it { should belong_to(:subscription) }
  end

  describe 'validations' do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:tea_id) }
    it { should validate_presence_of(:subscription_id) }
  end
end
