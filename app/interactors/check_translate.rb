class CheckTranslate
  include Interactor

  def call
    if context.word == context.card.translated_text
      context.card.update_attributes(review_date: Date.today + 3.days)
      context.flash[:success] = 'Правильно! Следующая проверка: ' + context.card.review_date.strftime("%d/%m/%Y").to_s
    elsif context.word != context.card.translated_text
      context.flash[:danger] = 'Ошибка! '
    else
      context.fail!
    end
  end
end