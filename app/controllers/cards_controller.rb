class CardsController < ApplicationController
  before_action :card_find, only: [:show, :edit, :update, :destroy]

  def index
    @cards = current_user.cards.paginate(:page => params[:page], :per_page => 20).order('id ASC')
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = current_user.cards.create(card_params)
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
    if @card.valid?
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
    params.require(:card).permit(:original_text, :translated_text, :image)
  end

  def card_find
    @card = current_user.cards.find(params[:id])
  end
end