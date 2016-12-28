class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :cards
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }
  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
