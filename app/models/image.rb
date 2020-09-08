class Image < ApplicationRecord
  belongs_to :user
  has_many :charges
  validates :title, :source, presence: true
end