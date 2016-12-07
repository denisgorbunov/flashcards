require 'rails_helper'

RSpec.describe Card, type: :model do
  before(:all) do
    @card = create(:card)
  end

  it '#set_review_date' do
    expect(@card.review_date.strftime("%d/%m/%Y")).to eq (Time.now + 3.days).strftime("%d/%m/%Y")
  end

  it 'original_text, translated_text presence?' do
    is_expected.to validate_presence_of(:original_text)
    is_expected.to validate_presence_of(:translated_text)
  end

end