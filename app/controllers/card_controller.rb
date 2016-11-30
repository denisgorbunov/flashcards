class CardController < ApplicationController
  before_action :card_find, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.create(card_params)
    if @card.errors.empty?
      flash[:success] = 'Карточка создана'
      redirect_to card_path(@card)
    else
      flash[:danger] = 'При сохранении произошла ошибка'
      render 'new'
    end
  end

  def edit
  end

  def update
    @card = Card.update_attributes(card_params)
    if @card.errors.empty?
      flash[:success] = 'Карточка изменена'
      redirect_to card_path(@card)
    else
      flash[:danger] = 'При сохранении произошла ошибка'
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to action: 'index'
  end

  private
  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end

  def card_find
    @card = Card.find(params[:id])
  end
end