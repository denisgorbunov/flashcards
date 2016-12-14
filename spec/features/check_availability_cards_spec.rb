require 'rails_helper'

RSpec.feature "CheckAvailabilityCards", type: :feature do
  scenario "card not available" do
    visit root_path
    expect(page).to have_text 'Все карточки проверены'
  end

  scenario "card available" do
    @card = create(:card, original_text: "дом", translated_text: "house", review_date: (Date.today - 3.days))
    visit root_path
    expect(page).to have_text 'Укажите перевод данного слова'
  end
end
