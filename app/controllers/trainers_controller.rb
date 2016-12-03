class TrainersController < ApplicationController
  def check
    @card = Card.find(params[:card_id])
    puts @card.inspect
    if @card.translated_text.strip == params[:translating_word]
      @card.update_attributes(review_date: Time.now + 4.days)
      flash[:success] = 'Правильно! Следующая проверка: ' + @card.review_date.strftime("%d/%m/%Y").to_s
    else
      flash[:danger] = 'Ошибка!'
    end
    redirect_to root_path
  end
end
