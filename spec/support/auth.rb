module TestHelpers
  module Features
    def login_user(user, password)
      visit user_sessions_url

      fill_in 'email',    with: user.email
      fill_in 'password', with: password

      click_button 'Вход'
    end
  end
end