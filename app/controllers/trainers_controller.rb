class TrainersController < ApplicationController
  skip_before_action :require_login, only: [:check]
  def check
    @card = Card.find(params[:card_id])
    result = CheckTranslate.call(card: @card, word: params[:translating_word], flash: flash)
    redirect_to root_path, notice: result.notice
  end
end
