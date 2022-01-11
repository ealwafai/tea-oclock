require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'associations' do
    it { should have_many(:memberships) }
    it { should have_many(:customers).through(:memberships) }
    it { should have_many(:teas).through(:memberships) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_numericality_of(:price) }
    it { should validate_presence_of(:frequency) }
    it { should define_enum_for(:frequency).with_values(['Weekly', 'Bi-Weekly', 'Monthly']) }
  end
end
