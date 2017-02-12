class HomeController < ApplicationController
  def index
    @random_card = Card.where(user_id: current_user.id).random.first
  end
end