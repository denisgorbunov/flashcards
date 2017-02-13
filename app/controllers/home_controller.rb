class HomeController < ApplicationController
  def index
    @random_card = current_user.cards.random.first
  end
end
