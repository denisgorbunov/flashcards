class TrainersController < ApplicationController
  def check
    @card = Card.find(params[:card_id])
    result = CheckTranslate.call(card: @card, word: params[:translating_word])
    if result.success?
      flash[:success] = 'Правильно! Следующая проверка: ' + @card.review_date.strftime("%d/%m/%Y").to_s
     else
       flash[:danger] = 'Ошибка! '
    end
    redirect_to root_path
  end
end
