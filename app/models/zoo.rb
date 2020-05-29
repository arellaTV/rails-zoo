class Zoo < ApplicationRecord
  has_many :animals
  validates :name, presence: true, length: { maximum: 120 }
  validates :description, presence: true, length: { maximum: 512 }
  validates :address, length: { maximum: 120 }
end
