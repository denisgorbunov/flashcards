module Sorcery
  module TestHelpers
    module Rails
      module Integration
        def login_user_post(email, password)
          visit login_url

          page.fill_in 'email',    with: email
          page.fill_in 'password', with: password

          page.click_button 'Вход'
        end
      end
    end
  end
end