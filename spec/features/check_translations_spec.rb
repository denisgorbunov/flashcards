require 'rails_helper'

RSpec.feature "check translation", type: :feature do
  let!(:card) { create(:card, original_text: "дом", translated_text: "house", review_date: (Date.today - 3.days), user: create(:user))}
  before(:each) do
    login_user_post("test@test.com", "123")
  end

  scenario "correct translation" do
    visit root_path
    page.fill_in "translating_word", with: "house"
    page.click_on('Проверить')
    expect(page).to have_text 'Правильно!'
  end

  scenario "incorrect translation" do
    visit root_path
    page.fill_in "translating_word", with: "cat"
    page.click_on('Проверить')
    expect(page).to have_text 'Ошибка!'
  end
end
