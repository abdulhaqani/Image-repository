class Charge < ApplicationRecord
  belongs_to :user
  belongs_to :image
  validates :image_id, :price, presence: true
end