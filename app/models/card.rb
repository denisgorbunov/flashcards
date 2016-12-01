class Card < ApplicationRecord
  validates :original_text, :translated_text, :review_date, presence: true
  validate :check_card
  before_validation :set_review_date, on: :create

  protected
  def check_card
    errors.add(:translated_text, "не должен совпадать с оригиналом") unless self.original_text != self.translated_text
  end

  def set_review_date
    self.review_date ||= Time.now + 3.days
  end

end
