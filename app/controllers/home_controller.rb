class HomeController < ApplicationController
  def index
    @random_card = Card.random
  end
end