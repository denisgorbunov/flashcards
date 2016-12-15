require 'rails_helper'

RSpec.feature "CheckAvailabilityCards", type: :feature do
  let!(:user) { create(:user)}
  before(:each) do
    login_user_post("test@test.com", "123")
  end
  scenario "card not available" do
    visit root_path
    expect(page).to have_text 'Все карточки проверены'
  end

  scenario "card available" do
    create(:card, original_text: "дом", translated_text: "house", review_date: (Date.today - 3.days), user: create(:user))
    visit root_path
    expect(page).to have_text 'Укажите перевод данного слова'
  end
end
