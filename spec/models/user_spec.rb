require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { create(:user) }

  it 'email, password presence?' do
    is_expected.to validate_presence_of(:email)
    is_expected.to validate_presence_of(:password)
  end
end
