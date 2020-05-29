class Animal < ApplicationRecord
  belongs_to :zoo
  validates :name, presence: true, length: { maximum: 120 }
  validates :description, presence: true, length: { maximum: 512 }
end
