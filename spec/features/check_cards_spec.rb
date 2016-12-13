require 'rails_helper'

RSpec.feature "check translation ->", type: :feature do
  scenario "not available cards for traininig" do
    visit root_path
    expect(page).to have_text 'Все карточки проверены'
  end

  scenario "correct translation" do
    @card = create(:card, original_text: "дом", translated_text: "house", review_date: (Date.today - 3.days))
    visit root_path
    page.fill_in "translating_word", with: "house"
    page.click_on('Проверить')
    expect(page).to have_text 'Правильно!'
  end

  scenario "incorrect translation" do
    @card = create(:card, original_text: "дом", translated_text: "house", review_date: (Date.today - 3.days))
    visit root_path
    page.fill_in "translating_word", with: "cat"
    page.click_on('Проверить')
    expect(page).to have_text 'Ошибка!'
  end
end
