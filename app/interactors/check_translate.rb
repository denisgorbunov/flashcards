class CheckTranslate
  include Interactor

  def call
    if context.word == context.card.translated_text
      context.card.update_attributes(review_date: Time.now + 3.days)
    else
      context.fail!
    end
  end
end