class Animal < ApplicationRecord
  has_one_attached :cover_photo

  belongs_to :zoo
  validates :name, presence: true, length: { maximum: 120 }
  validates :description, presence: true, length: { maximum: 512 }
end
