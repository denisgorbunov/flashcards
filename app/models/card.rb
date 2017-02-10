class Card < ApplicationRecord
  belongs_to :user
  validates :original_text, :translated_text, :review_date, presence: true
  validate :validate_translated_text
  before_validation :set_review_date, on: :create

  scope :random, -> { where("review_date <= '#{Date.today}'").order("RANDOM()") }

  protected
  def validate_translated_text
    errors.add(:translated_text, "не должен совпадать с оригиналом") unless self.original_text.mb_chars.casecmp(self.translated_text.mb_chars) == -1
  end

  def set_review_date
    self.review_date ||= Time.now + 3.days
  end

end
