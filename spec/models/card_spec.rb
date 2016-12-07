require 'rails_helper'

RSpec.describe Card, type: :model do
  before(:all) do
    create(:card)
  end

  it '#set_review_date?' do
    expect(@card.review_date.strftime("%d/%m/%Y")).to eq (Time.now + 3.days).strftime("%d/%m/%Y")
  end
end

