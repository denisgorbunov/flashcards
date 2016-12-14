class Card < ApplicationRecord
  belongs_to :user
  validates :original_text, :translated_text, :review_date, presence: true
  validate :validate_card
  before_validation :set_review_date, on: :create

  protected
  def validate_card
    errors.add(:translated_text, "не должен совпадать с оригиналом") unless self.original_text != self.translated_text
  end

  def set_review_date
    self.review_date ||= Time.now + 3.days
  end

  def self.random
    where("review_date <= '#{Date.today}'").order("RANDOM()").first
  end
end
