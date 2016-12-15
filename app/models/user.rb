class User < ApplicationRecord
  has_many :cards
  validates :email, :password, presence: true
end
