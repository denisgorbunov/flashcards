class Card < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :original_text, :translated_text, :review_date, presence: true
  validate :check_for_a_match
  validates :image, file_size: {maximum: 2.megabytes.to_i, message: 'image should be less than 2Mb'},
            file_content_type: {allow: /^image\/.*/, message: 'allow images only'}

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
