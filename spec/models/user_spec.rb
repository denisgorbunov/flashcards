require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { FactoryGirl.create(:user) }

  it 'must be valid' do
    expect(user).not_to be_invalid
  end
end
