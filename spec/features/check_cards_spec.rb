require 'rails_helper'

RSpec.feature "CheckCards", type: :feature do
  scenario "must get 'success'" do
    visit root_path
  end
end
