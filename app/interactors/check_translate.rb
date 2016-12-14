class CheckTranslate
  include Interactor

  def call
    if context.word == context.card.translated_text
      context.card.update_attributes(review_date: Date.today + 3.days)
    else
      context.fail!
    end
  end
end