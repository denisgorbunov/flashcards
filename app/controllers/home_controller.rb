class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @random_card = Card.random
  end
end