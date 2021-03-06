require 'rails_helper'

RSpec.describe Card, type: :model do
  let!(:user) { create(:user) }
  let!(:card) { user.cards.create(original_text: "house", translated_text: "house") }

  it '#set_review_date' do
    expect(card.review_date.strftime("%d/%m/%Y")).to eq (Time.now + 3.days).strftime("%d/%m/%Y")
  end

  it '#validate_card' do
    expect(card).to be_invalid
  end

end