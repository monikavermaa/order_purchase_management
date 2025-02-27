require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have valid factory' do
    expect(FactoryBot.create(:user)).to be_valid
  end

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_confirmation_of(:password) }

  it { should allow_value('user@example.com').for(:email) }
  it { should_not allow_value('invalid_email').for(:email) }
end

