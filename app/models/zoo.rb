class Zoo < ApplicationRecord
  has_one_attached :cover_photo
  has_many :animals, dependent: :destroy
  validates :name, presence: true, length: { maximum: 120 }
  validates :description, presence: true, length: { maximum: 512 }
  validates :address, length: { maximum: 120 }
end
