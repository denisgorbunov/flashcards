class CardsController < ApplicationController
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
    if @card.valid?
      flash[:success] = 'Карточка создана'
      redirect_to card_path(@card)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @card.update_attributes(card_params)
    if @card.errors.empty?
      flash[:success] = 'Карточка изменена'
      redirect_to card_path(@card)
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    if @card.errors.empty?
      flash[:success] = 'Карточка удалена'
      redirect_to cards_path
    else
      flash[:danger] = 'При удалении произошла ошибка'
      render 'index'
    end
  end

  private
  def card_params
    params.require(:card).permit(:original_text, :translated_text)
  end

  def card_find
    @card = Card.find(params[:id])
  end
end