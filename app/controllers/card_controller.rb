class CardController < ApplicationController
  def index
    @cards = Card.all
  end
end