class User < ApplicationRecord
  before_save { self.email = email.downcase }

  has_many :images, dependent: :destroy
  has_many :charges

  validates :username, presence: true, 
                      uniqueness: true, 
                      length: { minimum: 3, maximum: 32 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, 
                      uniqueness: true, 
                      length: { maximum: 64 }, 
                      format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end