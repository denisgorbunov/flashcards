class Card < ApplicationRecord
  belongs_to :user
  validates :original_text, :translated_text, :review_date, presence: true
  validate :check_for_a_match
  before_validation :set_review_date, on: :create

  scope :random, -> { where("review_date <= '#{Date.today}'").order("RANDOM()") }

  protected
  def check_for_a_match
    errors.add(:translated_text, "не должен совпадать с оригиналом") unless self.original_text.casecmp(self.translated_text) != 0
  end

  def set_review_date
    self.review_date ||= Time.now + 3.days
  end

end
