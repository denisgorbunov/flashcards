require 'rails_helper'

RSpec.describe Card, type: :model do
  before(:all) do
    @card = Card.create({original_text: 'привет', translated_text: 'hello'})
  end

  it "must set review_date to Time.now +3.days (#{(Time.now + 3.days).strftime("%d/%m/%Y")})" do
    expect(@card.review_date.strftime("%d/%m/%Y")).to eq (Time.now + 3.days).strftime("%d/%m/%Y")
  end
end

